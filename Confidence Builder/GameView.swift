//
import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel
    @State private var currentIndex = 0
    @State private var isAnswered = false
    @State private var shakeTrigger = false // State for shaking effect

    var body: some View {
        ZStack {
            //  Background Image
            Image("bg")
                .resizable()
                .opacity(0.7)
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                //  Progress Bar
                ProgressView(value: Double(currentIndex + 1), total: Double(viewModel.challenges.count))
                    .progressViewStyle(LinearProgressViewStyle(tint: Color.yellow))
                    .frame(width: 300, height: 22)
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(6)
                    .shadow(color: Color.yellow.opacity(0.7), radius: 10, x: 0, y: 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.white.opacity(0.6), lineWidth: 1)
                    )
                    .padding(.all, 40)

                //  Title Bar
                Text("Categorize terms as a CLASS or OBJECT by selecting an option")
                    .font(.title2)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.gray.opacity(0.9))
                    .cornerRadius(8)

                Spacer()

                //  Display the question
                if currentIndex < viewModel.challenges.count {
                    let challenge = viewModel.challenges[currentIndex]

                    Text("Question: \(challenge.question) ?")
                        .font(.title)
                        .padding(.all)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .background(Color.white.opacity(3.9))
                        .cornerRadius(18)
                        .padding(45)
                        

                    //  Answer options as square buttons
                    HStack {
                        ForEach(challenge.options, id: \.self) { option in
                            Button(action: {
                                isAnswered = true
                                let isCorrect = viewModel.checkAnswer(for: currentIndex, selectedAnswer: option)

                                if !isCorrect {
                                    shakeTrigger.toggle() // Trigger shake animation for wrong answer
                                    UIImpactFeedbackGenerator(style: .medium).impactOccurred() // Vibrate on wrong answer
                                }

                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    if currentIndex < viewModel.challenges.count - 1 {
                                        currentIndex += 1
                                        isAnswered = false
                                    }
                                }
                                
                                if !isCorrect {
                                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                }

                            }) {
                                Text(option)
                                    .font(.title2)
                                    .frame(width: 140, height: 80)
                                    .background(viewModel.getButtonColor(for: currentIndex, option: option))
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                                    .modifier(ShakeEffect(trigger: shakeTrigger)) // Apply shake effect
                            }
                            
                            
                            
                            
                            
                            
                        }
                    }
                } else {
                    Text("Game Over!")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }

                Spacer()
            }
            .padding()
        }
    }
}

//  Shake Effect Modifier
struct ShakeEffect: GeometryEffect {
    var trigger: Bool
    var amount: CGFloat = 10
    var shakesPerUnit = 3

    var animatableData: CGFloat {
        trigger ? 1 : 0
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)), y: 0))
    }
}

//  Preview for Xcode
#Preview {
    GameView(viewModel: GameViewModel())
}
