import XCTest
import Thoth

//class TestOrderedNonOverlappingIntervals: XCTestCase {
//    
//    override func setUp() {
//        super.setUp()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
//    
//    //inits
//    
//    // () -> []
//    func testInitShouldCreateAnInstanceWithEmptyIntervals() {
//        
//        let intervals = OrderedNonOverlappingIntervals()
//        
//        let result = intervals.intervals
//        let expectedResult = [ClosedRange<OrderedNonOverlappingIntervals.Bound>]()
//        
//         XCTAssertEqual(result, expectedResult)
//    }
//    
//    // ([1...3, 5...8, 10...15]) -> [1...3, 5...8, 10...15]
//    func testInitFromArrayOfOrderedNonOverlappingIntervalsShouldCreateAnInstanceWithIntervalsEqualsToThatArray(){
//        
//        let array = [1.0...3.0, 5.0...8.0, 10.0...15.0]
//        let intervals = OrderedNonOverlappingIntervals(from: array)
//        
//        let result = intervals.intervals
//        let expectedResult = array
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // ([1...3, 10...15, 5...8]) -> [1...3, 5...8, 10...15]
//    func testInitFromArrayOfNonOrderedNonOverlappingIntervalsShouldCreateAnInstanceWithIntervalsEqualToThatArrayOrdered(){
//        
//        let array = [1.0...3.0, 10.0...15.0, 5.0...8.0]
//        let intervals = OrderedNonOverlappingIntervals(from: array)
//        
//        let result = intervals.intervals
//        let expectedResult = [1.0...3.0, 5.0...8.0, 10.0...15.0]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // ([1...3, 2...4, 5...8]) -> [1...4, 5...8]
//    func testInitFromArrayOfThreeIntervalsWhereFirstOneOverlapsSecondOneShouldCreateAnInstanceWithIntervalsEqualToArrayOfTheElementsOrderedAndMergedProperly(){
//        
//        let array = [1.0...3.0, 2.0...4.0, 5.0...8.0]
//        let intervals = OrderedNonOverlappingIntervals(from: array)
//        
//        let result = intervals.intervals
//        let expectedResult = [1.0...4.0, 5.0...8.0]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // ([1...3, 4...6, 5...8]) -> [1...3, 4...8]
//    func testInitFromArrayOfThreeIntervalsWhereSecondOneOverlapsThirdOneShouldCreateAnInstanceWithIntervalsEqualToArrayOfTheElementsOrderedAndMergedProperly(){
//        
//        let array = [1.0...3.0, 4.0...6.0, 5.0...8.0]
//        let intervals = OrderedNonOverlappingIntervals(from: array)
//        
//        let result = intervals.intervals
//        let expectedResult = [1.0...3.0, 4.0...8.0]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // ([1...3, 2...6, 5...8]) -> [1...8]
//    func testInitFromArrayOfThreeIntervalsWhereSecondOneOverlapsBothOthersShouldCreateAnInstanceWithIntervalsEqualToArrayOfTheElementsMergedInOne(){
//        
//        let array = [1.0...3.0, 2.0...6.0, 5.0...8.0]
//        let intervals = OrderedNonOverlappingIntervals(from: array)
//        
//        let result = intervals.intervals
//        let expectedResult = [1.0...8.0]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    //no overlaping
//    
//    // [] + 1...10 -> [1...10]
//    func testIntervalShouldBeAddedToEmptyArray() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let intervalToAd = 1.0...10.0
//        
//        intervals.add(intervalToAd)
//        
//        let result = intervals.intervals
//        let expectedResult = [intervalToAd]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // [5...10] + 1...3 -> [1...3, 5...10]
//    func testIntervalShouldBeAddedBeforeTheOnlyOne() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let intialInterval = 5.0...10.0
//        intervals.add(intialInterval)
//        
//        let intervalToAd = 1.0...3.0
//        
//        intervals.add(intervalToAd)
//        
//        let result = intervals.intervals
//        let expectedResult = [intervalToAd, intialInterval]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // [5...10] + 11...13 -> [5...10, 11...13]
//    func testIntervalShouldBeAddedAfterTheOnlyOne() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let intialInterval = 5.0...10.0
//        intervals.add(intialInterval)
//        
//        let intervalToAd = 11.0...13.0
//        
//        intervals.add(intervalToAd)
//        
//        let result = intervals.intervals
//        let expectedResult = [intialInterval, intervalToAd]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // [5...10, 13...18] + 11...12 -> [5...10, 11...12, 13...18]
//    func testIntervalShouldBeAddedBetweenTwo() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let firstInterval = 5.0...10.0
//        intervals.add(firstInterval)
//        
//        let secondInterval = 13.0...18.0
//        intervals.add(secondInterval)
//        
//        let intervalToAd = 11.0...12.0
//        
//        intervals.add(intervalToAd)
//        
//        let result = intervals.intervals
//        let expectedResult = [firstInterval, intervalToAd, secondInterval]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    //overlaping
//    
//    //overlaping - subset
//    
//    // [5...10] + 6...8 -> [5...10]
//    func testIntervalShouldBeIgnoredBecauseIsASubsetOfTheOnlyOne() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let intialInterval = 5.0...10.0
//        intervals.add(intialInterval)
//        
//        let intervalToAd = 6.0...8.0
//        
//        intervals.add(intervalToAd)
//        
//        let result = intervals.intervals
//        let expectedResult = [intialInterval]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // [5...10, 13...18] + 15...17 -> [5...10, 13...18]
//    func testIntervalShouldBeIgnoredBecauseIsASubsetOfTheLastOfTwo() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let firstInterval = 5.0...10.0
//        intervals.add(firstInterval)
//        
//        let secondInterval = 13.0...18.0
//        intervals.add(secondInterval)
//        
//        let intervalToAd = 15.0...17.0
//        
//        intervals.add(intervalToAd)
//        
//        let result = intervals.intervals
//        let expectedResult = [firstInterval, secondInterval]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // [5...10, 13...18, 23...28] + 15...17 -> [5...10, 13...18, 23...28]
//    func testIntervalShouldBeIgnoredBecauseIsASubsetOfTheMiddleOfThree() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let firstInterval = 5.0...10.0
//        intervals.add(firstInterval)
//        
//        let secondInterval = 13.0...18.0
//        intervals.add(secondInterval)
//        
//        let thirdInterval = 23.0...28.0
//        intervals.add(thirdInterval)
//        
//        let intervalToAd = 15.0...17.0
//        
//        intervals.add(intervalToAd)
//        
//        let result = intervals.intervals
//        let expectedResult = [firstInterval, secondInterval, thirdInterval]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    //overlaping - superset
//    
//    // [5...10] + 4...18 -> [4...18]
//    func testIntervalShouldReplaceTheOnlyOneBecauseIsASupersetOfTheOnlyOne() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let intialInterval = 5.0...10.0
//        intervals.add(intialInterval)
//        
//        let intervalToAd = 4.0...18.0
//        
//        intervals.add(intervalToAd)
//        let expectedMergedInterval = 4.0...18.0
//        
//        let result = intervals.intervals
//        let expectedResult = [expectedMergedInterval]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // [5...10, 13...18] + 12...19 -> [5...10, 12...19]
//    func testIntervalShouldReplaceTheLastOneBecauseIsASupersetOfTheLastOfTwo() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let firstInterval = 5.0...10.0
//        intervals.add(firstInterval)
//        
//        let secondInterval = 13.0...18.0
//        intervals.add(secondInterval)
//        
//        let intervalToAd = 12.0...19.0
//        
//        intervals.add(intervalToAd)
//        let expectedMergedInterval = 12.0...19.0
//        
//        let result = intervals.intervals
//        let expectedResult = [firstInterval, expectedMergedInterval]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // [5...10, 13...18] + 2...19 -> [2...19]
//    func testIntervalShouldReplaceAllBecauseIsASupersetOfBothTwo() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let firstInterval = 5.0...10.0
//        intervals.add(firstInterval)
//        
//        let secondInterval = 13.0...18.0
//        intervals.add(secondInterval)
//        
//        let intervalToAd = 2.0...19.0
//        
//        intervals.add(intervalToAd)
//        let expectedMergedInterval = 2.0...19.0
//        
//        let result = intervals.intervals
//        let expectedResult = [expectedMergedInterval]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // [5...10, 13...18, 21...28] + 12...19 -> [5...10, 12...19, 21...28]
//    func testIntervalShouldReplaceTheSecondOfThreeBecauseIsASupersetOfIt() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let firstInterval = 5.0...10.0
//        intervals.add(firstInterval)
//        
//        let secondInterval = 13.0...18.0
//        intervals.add(secondInterval)
//        
//        let thirdInterval = 21.0...28.0
//        intervals.add(thirdInterval)
//        
//        let intervalToAd = 12.0...19.0
//        
//        intervals.add(intervalToAd)
//        let expectedMergedInterval = 12.0...19.0
//        
//        let result = intervals.intervals
//        let expectedResult = [firstInterval, expectedMergedInterval, thirdInterval]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    //overlaping - partially
//    
//    // [5...10, 13...18] + 10...13 -> [5...18]
//    func testIntervalWithCommonBoundariesShouldBeMerged() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let firstInterval = 5.0...10.0
//        intervals.add(firstInterval)
//        
//        let secondInterval = 13.0...18.0
//        intervals.add(secondInterval)
//        
//        let intervalToAd = 10.0...13.0
//        
//        intervals.add(intervalToAd)
//        
//        let result = intervals.intervals
//        let expectedResult = [5.0...18.0]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // [5...10] + 2...6 -> [2...10]
//    func testIntervalOverlapsTheOnlyOneFromTheLeftAndShouldBeMergedWithIt() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let initialnterval = 5.0...10.0
//        intervals.add(initialnterval)
//        
//        let intervalToAd = 2.0...6.0
//        
//        intervals.add(intervalToAd)
//        let expectedMergedInterval = 2.0...10.0
//        
//        let result = intervals.intervals
//        let expectedResult = [expectedMergedInterval]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // [5...10] + 9...16 -> [5...16]
//    func testIntervalOverlapsTheOnlyOneFromTheRightAndShouldBeMergedWithIt() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let initialnterval = 5.0...10.0
//        intervals.add(initialnterval)
//        
//        let intervalToAd = 9.0...16.0
//        
//        intervals.add(intervalToAd)
//        let expectedMergedInterval = 5.0...16.0
//        
//        let result = intervals.intervals
//        let expectedResult = [expectedMergedInterval]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // [5...10, 15...20] + 12...16 -> [5...10, 12...20]
//    func testIntervalOverlapsTheLastOneOfTwoFromTheLeftAndShouldBeMergedWithIt() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let firstInterval = 5.0...10.0
//        intervals.add(firstInterval)
//        
//        let secondInterval = 15.0...20.0
//        intervals.add(secondInterval)
//        
//        let intervalToAd = 12.0...16.0
//        
//        intervals.add(intervalToAd)
//        let expectedMergedInterval = 12.0...20.0
//        
//        let result = intervals.intervals
//        let expectedResult = [firstInterval, expectedMergedInterval]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // [5...10, 15...20] + 18...26 -> [5...10, 15...26]
//    func testIntervalOverlapsTheLastOneOfTwoFromTheRightAndShouldBeMergedWithIt() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let firstInterval = 5.0...10.0
//        intervals.add(firstInterval)
//        
//        let secondInterval = 15.0...20.0
//        intervals.add(secondInterval)
//        
//        let intervalToAd = 18.0...26.0
//        
//        intervals.add(intervalToAd)
//        let expectedMergedInterval = 15.0...26.0
//        
//        let result = intervals.intervals
//        let expectedResult = [firstInterval, expectedMergedInterval]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // [5...10, 15...20, 22...25] + 16...21 -> [5...10, 15...21, 22...25]
//    func testIntervalOverlapsTheMiddleOneOfThreeFromTheRightAndShouldBeMergedWithIt() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let firstInterval = 5.0...10.0
//        intervals.add(firstInterval)
//        
//        let secondInterval = 15.0...20.0
//        intervals.add(secondInterval)
//        
//        let thirdInterval = 22.0...25.0
//        intervals.add(thirdInterval)
//        
//        let intervalToAd = 16.0...21.0
//        
//        intervals.add(intervalToAd)
//        let expectedMergedInterval = 15.0...21.0
//        
//        let result = intervals.intervals
//        let expectedResult = [firstInterval, expectedMergedInterval, thirdInterval]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    // [5...10, 15...20, 22...25] + 9...23 -> [5...25]
//    func testIntervalOverlapsTheFirstAndLastOneOfThreeAndIsSubsetOfTheMiddleOneAntTheyAllShouldBeMerged() {
//        
//        var intervals = OrderedNonOverlappingIntervals()
//        let firstInterval = 5.0...10.0
//        intervals.add(firstInterval)
//        
//        let secondInterval = 15.0...20.0
//        intervals.add(secondInterval)
//        
//        let thirdInterval = 22.0...25.0
//        intervals.add(thirdInterval)
//        
//        let intervalToAd = 9.0...23.0
//        
//        intervals.add(intervalToAd)
//        let expectedMergedInterval = 5.0...25.0
//        
//        let result = intervals.intervals
//        let expectedResult = [expectedMergedInterval]
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    //sum
//    
//    func testSum(){
//        
//        let intervals = OrderedNonOverlappingIntervals(from: [1.0...3.0, 5.0...9.0, 11.0...11.0])
//        
//        let result = intervals.sum()
//        let expectedResult = 9.0
//        
//        XCTAssertEqual(result, expectedResult)
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure() {
//            // Put the code you want to measure the time of here.
//        }
//    }
//    
//}
