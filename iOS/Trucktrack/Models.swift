import Foundation

struct Visit: Identifiable, Codable, Equatable {
    let id: UUID
    var truck: String
    var item: String
    var cost: Double
    var date: Date
    var createdAt: Date

    init(id: UUID = UUID(), truck: String = "", item: String = "", cost: Double = 0, date: Date = Date(), createdAt: Date = Date()) {
        self.id = id
        self.truck = truck
        self.item = item
        self.cost = cost
        self.date = date
        self.createdAt = createdAt
    }
}
