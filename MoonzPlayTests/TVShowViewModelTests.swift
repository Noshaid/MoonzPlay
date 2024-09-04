//
//  TVShowViewModelTests.swift
//  MoonzPlayTests
//
//  Created by Noshaid Ali on 04/09/2024.
//

import XCTest
@testable import MoonzPlay
import Alamofire

final class TVShowViewModelTests: XCTestCase {

    var sut: TVShowViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testFetchTVShow_WhenAPIisCalled_ShouldUpdateData() {
        // Arrange
        let mockTVShow = TVShow(id: 1, name: "MyTVShow", backdrop_path: "backdrop path", overview: "this is overview", first_air_date: "12-12-2020", genres: nil, number_of_seasons: 0, seasons: nil)
        
        let mockNetworkService = MockTVShowNetworkService(mockTVShow: mockTVShow)
        sut = .init(tvShowNetworkService: mockNetworkService)
        
        let expectation = expectation(description: "Call back Expectation")

        var count = 1
        // Aseert + Act
        sut.onDataUpdated = {
            if count == 1 {
                XCTAssertEqual(self.sut.tvShow?.name, mockTVShow.name)
                XCTAssertNotNil(self.sut.tvShow, "TV show should have been set on success of API")
                expectation.fulfill()
            }
            count += 1
        }
        sut.fetchTVShow(tvShowID: 1)
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchTVShow_WhenAPIisCalled_ShouldCallSeasonAPI() {
        // Arrange
        let mockTVShow = TVShow(id: 1, name: "MyTVShow", backdrop_path: "backdrop path", overview: "this is overview", first_air_date: "12-12-2020", genres: nil, number_of_seasons: 0, seasons: nil)
        
        let mockSeason = Season(air_date: nil, id: nil, _id: nil, name: "My Season", overview: nil, poster_path: nil, season_number: nil, vote_average: nil, episodes: nil)
        
        let mockNetworkService = MockTVShowNetworkService(mockTVShow: mockTVShow, mockSeason: mockSeason)
        sut = .init(tvShowNetworkService: mockNetworkService)
        
        let expectation = expectation(description: "Call back Expectation")

        var count = 1
        // Aseert + Act
        sut.onDataUpdated = {
            if count == 2 {
                XCTAssertEqual(self.sut.season?.name, mockSeason.name)
                expectation.fulfill()
            }
            count += 1
        }
        sut.fetchTVShow(tvShowID: 1)
        wait(for: [expectation], timeout: 1.0)
    }
}
