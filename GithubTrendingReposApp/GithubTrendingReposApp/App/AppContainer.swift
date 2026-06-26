//
//  AppContainer.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Foundation

final class AppContainer {
    lazy var apiClient: APIClient = {
        APIClientImpl()
    } ()
    
    lazy var remoteDataSource: ReposRemoteDataSource = {
        ReposRemoteDataSourceImpl(apiClient: apiClient)
    } ()
    
    lazy var localDataSource: ReposLocalDataSource = {
        ReposLocalDataSourceImpl()
    } ()
    
    lazy var repository: ReposRepositoryProtocol = {
        ReposRepositoriesImpl(remoteDataSource, localDataSource)
    } ()
    
    lazy var fetchReposUseCase: FetchReposUseCase = {
        FetchReposUseCaseImplementation(repository)
    } ()
    
    lazy var searchReposUseCase: SearchRepositoriesUseCase = {
        SearchRepositoriesUseCaseImplemetation()
    } ()
    
    //MARK: - View Model
    lazy var repoViewModel = RepositoryListViewModel(fetchReposUseCase, searchReposUseCase)
    
}
