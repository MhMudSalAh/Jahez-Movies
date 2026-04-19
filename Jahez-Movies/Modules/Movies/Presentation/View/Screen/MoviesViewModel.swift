//
//  MoviesViewModel.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Combine
import Foundation

final class MoviesViewModel: ObservableObject {
    
    // MARK: - Propreties
        
    private let useCase: MoviesUseCase
    private let router: Router
    
    @Published private(set) var movies: [MovieModel] = []
    @Published private(set) var filteredMovies: [MovieModel] = []
    @Published private(set) var categories: [CategoryModel] = []
    @Published var searchQuery: String = ""
    @Published var selectedId: Int = 0
    @Published var isNoData: Bool = false
    private var nextPage: Int = 1
    
    // MARK: - Init
    
    init(
        useCase: MoviesUseCase,
        router: Router
    ) {
        self.useCase = useCase
        self.router = router
        setupBindings()
    }
    
    // MARK: - Implementation
    
    func viewDidLoad() async {
        await getCategories()
        await getMovies()
    }
    
    func loadMore(currentItem: MovieModel) async {
        guard let lastItem = movies.last, currentItem.id == lastItem.id else { return }
        await getMovies()
    }
    
    @MainActor
    private func getMovies() async {
        let result = await useCase.getMovies(page: nextPage)
        switch result {
        case let .success((movies, page)):
            self.movies.append(contentsOf: movies)
            self.nextPage = page + 1
        case .failure(_):
            break
        }
    }
    
    @MainActor
    private func getCategories() async {
        let result = await useCase.getCategories()
        switch result {
        case let .success(categories):
            self.categories = categories
        case .failure(_):
            break
        }
    }
    
    func setupBindings() {
        $searchQuery
            .combineLatest($movies)
            .map { (searchQuery, movies) in
                movies.filter {
                    searchQuery.isEmpty ? true :
                    $0.title.localizedCaseInsensitiveContains(searchQuery)
                }
            }
            .assign(to: &$filteredMovies)
        
        $selectedId
            .combineLatest($movies)
            .map { (selectedId, movies) in
                movies.filter {
                    selectedId == 0 ? true :
                        $0.categoriesIDs?.contains(selectedId) == true
                }
            }
            .assign(to: &$filteredMovies)
        
        $searchQuery
            .combineLatest($selectedId, $filteredMovies)
            .map { (searchQuery, selectedId, filtered) in
                (!searchQuery.isEmpty || selectedId != 0) && filtered.isEmpty
            }
            .assign(to: &$isNoData)
    }
    
    func didSelectMovie(_ movie: MovieModel) {
        // TODO: -
    }
}
