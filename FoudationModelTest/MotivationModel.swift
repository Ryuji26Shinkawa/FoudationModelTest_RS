//
//  MotivationViewModel.swift
//  FoudationModelTest
//
//  Created by 新川竜司 on 2025/09/17.
//

import FoundationModels
import SwiftUI

/// やる気・感謝メッセージを生成するViewModel
@Observable
/// やる気や感謝のメッセージをAIで生成するモデル
class MotivationModel {
    /// 生成結果の表示用メッセージ
    @MainActor var message: String = "ここにメッセージが表示されます"
    /// LLMセッションを管理する内部プロパティ
    private var session: LanguageModelSession?

    /// 初期化時にセッションセットアップを非同期で開始
    init() {
        Task {
            try? await setup()
        }
    }

    /// LLMセッションを初期化する非公開メソッド
    private func setup() async throws {
        session = LanguageModelSession()
    }

    /// 与えられたタイプに応じたメッセージを生成し、結果を message に格納
    @MainActor
    func generate(for type: MessageType) async throws -> String{
            message = "生成中..."
            guard let session else { return "sessionを取得できませんでした。"}

            let prompt = switch type {
            case .motivation: // やる気
                "今日も最高の1日にするためのやる気の出るメラメラと燃え盛るような言葉を一つください。"
            case .gratitude: // 感謝
                "頑張った人をねぎらうとってもふんわりとした優しい一言を一つください。"
            }
        let response = try await session.respond(to: prompt)
        return response.content
        }
    }

/// 生成するメッセージのタイプ
enum MessageType {
    case motivation, gratitude
}
