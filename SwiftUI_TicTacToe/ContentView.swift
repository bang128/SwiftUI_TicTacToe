import SwiftUI

struct ContentView: View {
    @StateObject var gameState = GameState()
    var body: some View {
        VStack() {
            let borderSize = CGFloat(7)
            Text("TIC-TAC-TOE")
                .font(.system(size: 35))
                .bold()
                .padding()
            Spacer().frame(height: 35)
            Text(gameState.showTurn())
                .font(.title)
                .background(Color.white)
                .bold()
                .padding()
            
            Text(String(format: "Player O: %d        Player X: %d", gameState.OScores, gameState.XScores))
                .font(.system(size: 28))
                .background(Color.white)
                .padding()
                .bold()
            
            Spacer().frame(height: 50)
            
            ForEach(0...2, id: \.self) {
                row in HStack(spacing: borderSize) {
                    ForEach(0...2, id: \.self) {
                        col in
                        let cell = gameState.board[row][col]
                        Text(cell.displaySymbol())
                            .font(.system(size: 60))
                            .foregroundColor(cell.displayColor())
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.black)
                            .onTapGesture {
                                gameState.playGame(row: row, col: col)
                            }
                    }
                }
            }
        }
        .background(Color.white)
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .offset(x: 0, y: 0)
        .alert(isPresented: $gameState.showAlert) {
            Alert(title: Text(gameState.alert),
                  dismissButton: .default(Text("OK")) { gameState.reset() } )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
