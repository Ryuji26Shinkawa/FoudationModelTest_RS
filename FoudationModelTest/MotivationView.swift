//
//  MotivationView.swift
//  FoudationModelTest
//
//  Created by 新川竜司 on 2025/09/17.
//

import SwiftUI
import FoundationModels

/// やる気・感謝メッセージを表示し、生成操作を行う画面
struct MotivationView: View {
    /// 生成用ViewModelを保持
    var model = MotivationModel()
    var body: some View {
        // 画面レイアウトの開始
        VStack(spacing: 40) {
            // 生成メッセージ表示用テキスト
            Text(model.message)
                .font(.title2)
                .padding()
                .multilineTextAlignment(.center)

            // 2つの生成ボタン（やる気・感謝）
            HStack(spacing: 40) {
                // やる気メッセージ生成ボタン
                Button {
                    // やる気メッセージ生成処理
                    Task {
                        let msg = try? await model.generate(for: .motivation)
                        await MainActor.run { model.message = msg ?? "失敗しました" }
                    }
                } label: {
                    VStack {
                        Image(systemName: "flame.fill")
                            .font(.system(size: 40))
                        Text("🔥")
                    }
                }

                // 感謝メッセージ生成ボタン
                Button {
                    // 感謝メッセージ生成処理
                    Task {
                        let msg = try? await model.generate(for: .gratitude)
                        await MainActor.run { model.message = msg ?? "失敗しました" }
                    }
                } label: {
                    VStack {
                        Image(systemName: "cup.and.saucer.fill")
                            .font(.system(size: 40))
                        Text("☕")
                    }
                }
            }
        }
        // 全体にパディング
        .padding()
    }
}

/// プレビュー用
#Preview {
    MotivationView()
}
