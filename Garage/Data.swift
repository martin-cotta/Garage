import Foundation
import UXLibrary

private let seltosServices: [Service] = [
    .init(
        date: .init(year: 2024, month: 3, day: 12)!,
        miles: 7861,
        details:
        """
        K6995: Synthetic oil change with tire rotation
        KWASH: Exterior car wash
        """),
    .init(
        date: .init(year: 2024, month: 9, day: 6)!,
        miles: 12615,
        details:
        """
        K7995: Synthetic oil change with tire rotation
        KWASH: Exterior car wash
        KCAB: Replace cabin air filter
        KAIR: Replace engine air filter    
        """),
    .init(
        date: .init(year: 2025, month: 3, day: 20)!,
        miles: 18807,
        details:
        """
        K8995: Full synthetic oil change
        KROT: Rotate tires & inspect brakes
        KWASH: Exterior car wash
        """),
    .init(
        date: .init(year: 2025, month: 9, day: 16)!,
        miles: 21929,
        details:
        """
        KRECALL SA592: Oil change reminder reset (not updated)
        KRECALL SA605: AWD coupling actuator logic improv
        K8995: Full synthetic oil change
        KROT10: Tire rotation
        900: Key fog programming
        KWASH: Exterior car wash
        """),
]

let data = [
    Car(
        name: "2024 Kia Seltos",
        desc: "Kia Seltos X-line Turbo AWD",
        purchaseDate: .init(year: 2023, month: 9, day: 9)!,
        manufactureDate: .init(year: 2023, month: 5, day: 1)!,
        year: 2024,
        brand: "Kia",
        model: "Seltos",
        color: "Exterior: Fusion Black, interior: Black",
        vin: "KNDEUCA75R7511635",

        powertrain: .init(
            engine: "1.6L Turbo 4-cylinder (195 hp)",
            transmission: "8-Speed automatic transmission"),

        wheels: .init(
            rims: "18\" Gloss black finished alloy (7.5J x 18)",
            tires: "Majesty 9 Solus 235/45 R18 94V",
            pressure: 33,
            tireSpecs: """
             Brand: Kumho
             model: Majesty 9 Solus TA91
             Section width: 235 mm
             Aspect ratio: 45% (of section width)
             Construction type: R (radial)
             Rim diameter: 18"
             Load index: 94 (1,477 lbs)
             Speed rating: V (up to 149mph)
            """),

        services: seltosServices,

        fuel: Fuel(
            type: "Unleaded gasoline (don't use methanol)",
            octaneRating: "(R+M)/2 of 87+ (MON of 91+)",
            capacity: 13.20,
            highwayFuelEfficiency: 27,
            cityFuelEfficiency: 25)),

//    Car(id: "ram-logo",
//        name: "2016 RAM 1500",
//        desc: "RAM 1500 Tradesman Reg Cab 4x2",
//        year: 2016,
//        brand: "RAM",
//        model: "1500",
//        color: "TBD",
//        vin: "3C6JR6AT5GG194009",
//        engine: "",
//        transmission: "",
//        wheels: "",
//        services: []),
]
