import XCTest
import Thoth

class TestOrderedNonOverlappingIntervals: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //no overlaping
    func testIntervalShouldBeAddedToEmptyArray() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let intervalToAd = 1...10
        
        intervals.add(intervalToAd)
        let expectedResult = [intervalToAd]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    func testIntervalShouldBeAddedBeforeTheOnlyOne() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let intialInterval = 5...10
        intervals.add(intialInterval)
        
        let intervalToAd = 1...3
        
        intervals.add(intervalToAd)
        let expectedResult = [intervalToAd, intialInterval]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    func testIntervalShouldBeAddedAfterTheOnlyOne() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let intialInterval = 5...10
        intervals.add(intialInterval)
        
        let intervalToAd = 11...13
        
        intervals.add(intervalToAd)
        let expectedResult = [intialInterval, intervalToAd]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    func testIntervalShouldBeAddedBetweenTwo() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let firstInterval = 5...10
        intervals.add(firstInterval)
        
        let secondInterval = 13...18
        intervals.add(secondInterval)
        
        let intervalToAd = 11...12
        
        intervals.add(intervalToAd)
        let expectedResult = [firstInterval, intervalToAd, secondInterval]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    //overlaping - subset
    
    func testIntervalShouldBeIgnoredBecauseIsASubsetOfTheOnlyOne() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let intialInterval = 5...10
        intervals.add(intialInterval)
        
        let intervalToAd = 6...8
        
        intervals.add(intervalToAd)
        let expectedResult = [intialInterval]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    func testIntervalShouldBeIgnoredBecauseIsASubsetOfTheLastOfTwo() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let firstInterval = 5...10
        intervals.add(firstInterval)
        
        let secondInterval = 13...18
        intervals.add(secondInterval)
        
        let intervalToAd = 15...17
        
        intervals.add(intervalToAd)
        let expectedResult = [firstInterval, secondInterval]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    func testIntervalShouldBeIgnoredBecauseIsASubsetOfTheMiddleOfThree() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let firstInterval = 5...10
        intervals.add(firstInterval)
        
        let secondInterval = 13...18
        intervals.add(secondInterval)
        
        let thirdInterval = 23...28
        intervals.add(thirdInterval)
        
        let intervalToAd = 15...17
        
        intervals.add(intervalToAd)
        let expectedResult = [firstInterval, secondInterval, thirdInterval]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    //overlaping - superset
    
    func testIntervalShouldReplaceTheOnlyOneBecauseIsASupersetOfTheOnlyOne() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let intialInterval = 5...10
        intervals.add(intialInterval)
        
        let intervalToAd = 4...18
        
        intervals.add(intervalToAd)
        let expectedMergedInterval = 4...18
        let expectedResult = [expectedMergedInterval]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    func testIntervalShouldReplaceTheLastOneBecauseIsASupersetOfTheLastOfTwo() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let firstInterval = 5...10
        intervals.add(firstInterval)
        
        let secondInterval = 13...18
        intervals.add(secondInterval)
        
        let intervalToAd = 12...19
        
        intervals.add(intervalToAd)
        let expectedMergedInterval = 12...19
        let expectedResult = [firstInterval, expectedMergedInterval]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    func testIntervalShouldReplaceAllBecauseIsASupersetOfBothTwo() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let firstInterval = 5...10
        intervals.add(firstInterval)
        
        let secondInterval = 13...18
        intervals.add(secondInterval)
        
        let intervalToAd = 2...19
        
        intervals.add(intervalToAd)
        let expectedMergedInterval = 2...19
        let expectedResult = [expectedMergedInterval]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    func testIntervalShouldReplaceTheSecondOfThreeBecauseIsASupersetOfIt() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let firstInterval = 5...10
        intervals.add(firstInterval)
        
        let secondInterval = 13...18
        intervals.add(secondInterval)
        
        let thirdInterval = 21...28
        intervals.add(thirdInterval)
        
        let intervalToAd = 12...19
        
        intervals.add(intervalToAd)
        let expectedMergedInterval = 12...19
        let expectedResult = [firstInterval, expectedMergedInterval, thirdInterval]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    //overlaping - partially
    
    func testIntervalOverlapsTheOnlyOneFromTheLeftAndShouldBeMergedWithIt() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let initialnterval = 5...10
        intervals.add(initialnterval)
        
        let intervalToAd = 2...6
        
        intervals.add(intervalToAd)
        let expectedMergedInterval = 2...10
        let expectedResult = [expectedMergedInterval]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    func testIntervalOverlapsTheOnlyOneFromTheRightAndShouldBeMergedWithIt() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let initialnterval = 5...10
        intervals.add(initialnterval)
        
        let intervalToAd = 9...16
        
        intervals.add(intervalToAd)
        let expectedMergedInterval = 5...16
        let expectedResult = [expectedMergedInterval]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    func testIntervalOverlapsTheLastOneOfTwoFromTheLeftAndShouldBeMergedWithIt() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let firstInterval = 5...10
        intervals.add(firstInterval)
        
        let secondInterval = 15...20
        intervals.add(secondInterval)
        
        let intervalToAd = 12...16
        
        intervals.add(intervalToAd)
        let expectedMergedInterval = 12...20
        let expectedResult = [firstInterval, expectedMergedInterval]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    func testIntervalOverlapsTheLastOneOfTwoFromTheRightAndShouldBeMergedWithIt() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let firstInterval = 5...10
        intervals.add(firstInterval)
        
        let secondInterval = 15...20
        intervals.add(secondInterval)
        
        let intervalToAd = 18...26
        
        intervals.add(intervalToAd)
        let expectedMergedInterval = 15...26
        let expectedResult = [firstInterval, expectedMergedInterval]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    func testIntervalOverlapsTheMiddleOneOfThreeFromTheRightAndShouldBeMergedWithIt() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let firstInterval = 5...10
        intervals.add(firstInterval)
        
        let secondInterval = 15...20
        intervals.add(secondInterval)
        
        let thirdInterval = 22...25
        intervals.add(thirdInterval)
        
        let intervalToAd = 16...21
        
        intervals.add(intervalToAd)
        let expectedMergedInterval = 15...21
        let expectedResult = [firstInterval, expectedMergedInterval, thirdInterval]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    func testIntervalOverlapsTheFirstAndLastOneOfThreeAndIsSubsetOfTheMiddleOneAntTheyAllShouldBeMerged() {
        
        var intervals = OrderedNonOverlappingIntervals()
        let firstInterval = 5...10
        intervals.add(firstInterval)
        
        let secondInterval = 15...20
        intervals.add(secondInterval)
        
        let thirdInterval = 22...25
        intervals.add(thirdInterval)
        
        let intervalToAd = 9...23
        
        intervals.add(intervalToAd)
        let expectedMergedInterval = 5...25
        let expectedResult = [expectedMergedInterval]
        
        XCTAssertEqual(intervals.intervals, expectedResult)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
