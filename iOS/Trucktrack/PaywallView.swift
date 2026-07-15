import SwiftUI

struct PaywallView: View {
    @EnvironmentObject var purchaseManager: PurchaseManager
    @EnvironmentObject var store: Store
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            VStack(spacing: 20) {
                Image(systemName: "star.circle.fill")
                    .font(.system(size: 64))
                    .foregroundStyle(Theme.accent)

                Text("Unlock Pro")
                    .font(Theme.titleFont)
                    .foregroundStyle(Theme.textPrimary)

                Text("Favorite truck ranking and monthly spend chart")
                    .font(Theme.bodyFont)
                    .foregroundStyle(Theme.textSecondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)

                Button {
                    Task {
                        await purchaseManager.purchasePro()
                        store.isPro = purchaseManager.isPro
                        if purchaseManager.isPro { dismiss() }
                    }
                } label: {
                    Text(verbatim: {
                        if let price = purchaseManager.product?.displayPrice { return "Upgrade — \(price)" }
                        return "Upgrade — $2.99 one-time"
                    }())
                        .font(Theme.bodyFont.weight(.bold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Theme.accent)
                        .foregroundStyle(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .accessibilityIdentifier("upgradeButton")
                .padding(.horizontal, 32)

                Button("Not Now") {
                    dismiss()
                }
                .foregroundStyle(Theme.textSecondary)
                .accessibilityIdentifier("dismissPaywallButton")
            }
            .padding()
        }
    }
}
