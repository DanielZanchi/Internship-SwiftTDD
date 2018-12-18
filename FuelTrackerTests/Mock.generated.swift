// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


//swiftlint:disable force_cast
//swiftlint:disable function_body_length
//swiftlint:disable line_length
//swiftlint:disable vertical_whitespace

#if MockyCustom
import SwiftyMocky
import SQLite
@testable import FuelTracker

    public final class MockyAssertion {
        public static var handler: ((Bool, String, StaticString, UInt) -> Void)?
    }

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        guard let handler = MockyAssertion.handler else {
            assert(expression, message, file: file, line: line)
            return
        }

        handler(expression(), message(), file, line)
    }
#elseif Mocky
import SwiftyMocky
import XCTest
import SQLite
@testable import FuelTracker

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        XCTAssert(expression(), message(), file: file, line: line)
    }
#else
import Sourcery
import SourceryRuntime
#endif



// MARK: - DatabaseManagerProtocol
class DatabaseManagerProtocolMock: DatabaseManagerProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    typealias PropertyStub = Given
    typealias MethodStub = Given
    typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    required init(manager: FileManager) { }

    func addFuel(dateOfFuel: Date, mileageOnSave: Int, quantityOfFuel: Double, pricePerUnitOfFuel: Double) -> Int64 {
        addInvocation(.m_addFuel__dateOfFuel_dateOfFuelmileageOnSave_mileageOnSavequantityOfFuel_quantityOfFuelpricePerUnitOfFuel_pricePerUnitOfFuel(Parameter<Date>.value(`dateOfFuel`), Parameter<Int>.value(`mileageOnSave`), Parameter<Double>.value(`quantityOfFuel`), Parameter<Double>.value(`pricePerUnitOfFuel`)))
		let perform = methodPerformValue(.m_addFuel__dateOfFuel_dateOfFuelmileageOnSave_mileageOnSavequantityOfFuel_quantityOfFuelpricePerUnitOfFuel_pricePerUnitOfFuel(Parameter<Date>.value(`dateOfFuel`), Parameter<Int>.value(`mileageOnSave`), Parameter<Double>.value(`quantityOfFuel`), Parameter<Double>.value(`pricePerUnitOfFuel`))) as? (Date, Int, Double, Double) -> Void
		perform?(`dateOfFuel`, `mileageOnSave`, `quantityOfFuel`, `pricePerUnitOfFuel`)
		var __value: Int64
		do {
		    __value = try methodReturnValue(.m_addFuel__dateOfFuel_dateOfFuelmileageOnSave_mileageOnSavequantityOfFuel_quantityOfFuelpricePerUnitOfFuel_pricePerUnitOfFuel(Parameter<Date>.value(`dateOfFuel`), Parameter<Int>.value(`mileageOnSave`), Parameter<Double>.value(`quantityOfFuel`), Parameter<Double>.value(`pricePerUnitOfFuel`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for addFuel(dateOfFuel: Date, mileageOnSave: Int, quantityOfFuel: Double, pricePerUnitOfFuel: Double). Use given")
			Failure("Stub return value not specified for addFuel(dateOfFuel: Date, mileageOnSave: Int, quantityOfFuel: Double, pricePerUnitOfFuel: Double). Use given")
		}
		return __value
    }

    func getFuels() -> [Fuel]? {
        addInvocation(.m_getFuels)
		let perform = methodPerformValue(.m_getFuels) as? () -> Void
		perform?()
		var __value: [Fuel]? = nil
		do {
		    __value = try methodReturnValue(.m_getFuels).casted()
		} catch {
			// do nothing
		}
		return __value
    }

    func deleteFuel(fID: Int64) -> Bool {
        addInvocation(.m_deleteFuel__fID_fID(Parameter<Int64>.value(`fID`)))
		let perform = methodPerformValue(.m_deleteFuel__fID_fID(Parameter<Int64>.value(`fID`))) as? (Int64) -> Void
		perform?(`fID`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_deleteFuel__fID_fID(Parameter<Int64>.value(`fID`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for deleteFuel(fID: Int64). Use given")
			Failure("Stub return value not specified for deleteFuel(fID: Int64). Use given")
		}
		return __value
    }

    func updateFuel(fID: Int64, newFuel: Fuel) -> Bool {
        addInvocation(.m_updateFuel__fID_fIDnewFuel_newFuel(Parameter<Int64>.value(`fID`), Parameter<Fuel>.value(`newFuel`)))
		let perform = methodPerformValue(.m_updateFuel__fID_fIDnewFuel_newFuel(Parameter<Int64>.value(`fID`), Parameter<Fuel>.value(`newFuel`))) as? (Int64, Fuel) -> Void
		perform?(`fID`, `newFuel`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_updateFuel__fID_fIDnewFuel_newFuel(Parameter<Int64>.value(`fID`), Parameter<Fuel>.value(`newFuel`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for updateFuel(fID: Int64, newFuel: Fuel). Use given")
			Failure("Stub return value not specified for updateFuel(fID: Int64, newFuel: Fuel). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_addFuel__dateOfFuel_dateOfFuelmileageOnSave_mileageOnSavequantityOfFuel_quantityOfFuelpricePerUnitOfFuel_pricePerUnitOfFuel(Parameter<Date>, Parameter<Int>, Parameter<Double>, Parameter<Double>)
        case m_getFuels
        case m_deleteFuel__fID_fID(Parameter<Int64>)
        case m_updateFuel__fID_fIDnewFuel_newFuel(Parameter<Int64>, Parameter<Fuel>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_addFuel__dateOfFuel_dateOfFuelmileageOnSave_mileageOnSavequantityOfFuel_quantityOfFuelpricePerUnitOfFuel_pricePerUnitOfFuel(let lhsDateoffuel, let lhsMileageonsave, let lhsQuantityoffuel, let lhsPriceperunitoffuel), .m_addFuel__dateOfFuel_dateOfFuelmileageOnSave_mileageOnSavequantityOfFuel_quantityOfFuelpricePerUnitOfFuel_pricePerUnitOfFuel(let rhsDateoffuel, let rhsMileageonsave, let rhsQuantityoffuel, let rhsPriceperunitoffuel)):
                guard Parameter.compare(lhs: lhsDateoffuel, rhs: rhsDateoffuel, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsMileageonsave, rhs: rhsMileageonsave, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsQuantityoffuel, rhs: rhsQuantityoffuel, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsPriceperunitoffuel, rhs: rhsPriceperunitoffuel, with: matcher) else { return false } 
                return true 
            case (.m_getFuels, .m_getFuels):
                return true 
            case (.m_deleteFuel__fID_fID(let lhsFid), .m_deleteFuel__fID_fID(let rhsFid)):
                guard Parameter.compare(lhs: lhsFid, rhs: rhsFid, with: matcher) else { return false } 
                return true 
            case (.m_updateFuel__fID_fIDnewFuel_newFuel(let lhsFid, let lhsNewfuel), .m_updateFuel__fID_fIDnewFuel_newFuel(let rhsFid, let rhsNewfuel)):
                guard Parameter.compare(lhs: lhsFid, rhs: rhsFid, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsNewfuel, rhs: rhsNewfuel, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_addFuel__dateOfFuel_dateOfFuelmileageOnSave_mileageOnSavequantityOfFuel_quantityOfFuelpricePerUnitOfFuel_pricePerUnitOfFuel(p0, p1, p2, p3): return p0.intValue + p1.intValue + p2.intValue + p3.intValue
            case .m_getFuels: return 0
            case let .m_deleteFuel__fID_fID(p0): return p0.intValue
            case let .m_updateFuel__fID_fIDnewFuel_newFuel(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


        static func addFuel(dateOfFuel: Parameter<Date>, mileageOnSave: Parameter<Int>, quantityOfFuel: Parameter<Double>, pricePerUnitOfFuel: Parameter<Double>, willReturn: Int64...) -> MethodStub {
            return Given(method: .m_addFuel__dateOfFuel_dateOfFuelmileageOnSave_mileageOnSavequantityOfFuel_quantityOfFuelpricePerUnitOfFuel_pricePerUnitOfFuel(`dateOfFuel`, `mileageOnSave`, `quantityOfFuel`, `pricePerUnitOfFuel`), products: willReturn.map({ Product.return($0) }))
        }
        static func getFuels(willReturn: [Fuel]?...) -> MethodStub {
            return Given(method: .m_getFuels, products: willReturn.map({ Product.return($0) }))
        }
        static func deleteFuel(fID: Parameter<Int64>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_deleteFuel__fID_fID(`fID`), products: willReturn.map({ Product.return($0) }))
        }
        static func updateFuel(fID: Parameter<Int64>, newFuel: Parameter<Fuel>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_updateFuel__fID_fIDnewFuel_newFuel(`fID`, `newFuel`), products: willReturn.map({ Product.return($0) }))
        }
        static func addFuel(dateOfFuel: Parameter<Date>, mileageOnSave: Parameter<Int>, quantityOfFuel: Parameter<Double>, pricePerUnitOfFuel: Parameter<Double>, willProduce: (Stubber<Int64>) -> Void) -> MethodStub {
            let willReturn: [Int64] = []
			let given: Given = { return Given(method: .m_addFuel__dateOfFuel_dateOfFuelmileageOnSave_mileageOnSavequantityOfFuel_quantityOfFuelpricePerUnitOfFuel_pricePerUnitOfFuel(`dateOfFuel`, `mileageOnSave`, `quantityOfFuel`, `pricePerUnitOfFuel`), products: willReturn.map({ Product.return($0) })) }()
			let stubber = given.stub(for: (Int64).self)
			willProduce(stubber)
			return given
        }
        static func getFuels(willProduce: (Stubber<[Fuel]?>) -> Void) -> MethodStub {
            let willReturn: [[Fuel]?] = []
			let given: Given = { return Given(method: .m_getFuels, products: willReturn.map({ Product.return($0) })) }()
			let stubber = given.stub(for: ([Fuel]?).self)
			willProduce(stubber)
			return given
        }
        static func deleteFuel(fID: Parameter<Int64>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_deleteFuel__fID_fID(`fID`), products: willReturn.map({ Product.return($0) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        static func updateFuel(fID: Parameter<Int64>, newFuel: Parameter<Fuel>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_updateFuel__fID_fIDnewFuel_newFuel(`fID`, `newFuel`), products: willReturn.map({ Product.return($0) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    struct Verify {
        fileprivate var method: MethodType

        static func addFuel(dateOfFuel: Parameter<Date>, mileageOnSave: Parameter<Int>, quantityOfFuel: Parameter<Double>, pricePerUnitOfFuel: Parameter<Double>) -> Verify { return Verify(method: .m_addFuel__dateOfFuel_dateOfFuelmileageOnSave_mileageOnSavequantityOfFuel_quantityOfFuelpricePerUnitOfFuel_pricePerUnitOfFuel(`dateOfFuel`, `mileageOnSave`, `quantityOfFuel`, `pricePerUnitOfFuel`))}
        static func getFuels() -> Verify { return Verify(method: .m_getFuels)}
        static func deleteFuel(fID: Parameter<Int64>) -> Verify { return Verify(method: .m_deleteFuel__fID_fID(`fID`))}
        static func updateFuel(fID: Parameter<Int64>, newFuel: Parameter<Fuel>) -> Verify { return Verify(method: .m_updateFuel__fID_fIDnewFuel_newFuel(`fID`, `newFuel`))}
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func addFuel(dateOfFuel: Parameter<Date>, mileageOnSave: Parameter<Int>, quantityOfFuel: Parameter<Double>, pricePerUnitOfFuel: Parameter<Double>, perform: @escaping (Date, Int, Double, Double) -> Void) -> Perform {
            return Perform(method: .m_addFuel__dateOfFuel_dateOfFuelmileageOnSave_mileageOnSavequantityOfFuel_quantityOfFuelpricePerUnitOfFuel_pricePerUnitOfFuel(`dateOfFuel`, `mileageOnSave`, `quantityOfFuel`, `pricePerUnitOfFuel`), performs: perform)
        }
        static func getFuels(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getFuels, performs: perform)
        }
        static func deleteFuel(fID: Parameter<Int64>, perform: @escaping (Int64) -> Void) -> Perform {
            return Perform(method: .m_deleteFuel__fID_fID(`fID`), performs: perform)
        }
        static func updateFuel(fID: Parameter<Int64>, newFuel: Parameter<Fuel>, perform: @escaping (Int64, Fuel) -> Void) -> Perform {
            return Perform(method: .m_updateFuel__fID_fIDnewFuel_newFuel(`fID`, `newFuel`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

