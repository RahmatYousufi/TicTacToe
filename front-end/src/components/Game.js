import React, { useState, useEffect } from "react";
import { calculateWinner } from "../helper";
import Board from "./Board";
import { Container } from "./styles/Container.styled";
import GlobalStyles from "./styles/Global";
import { getGameState, getScores, putGameState, putScores } from "../api/gameApi";

const Game = () => {
    
  const [gameState, setGameState] = useState(Array(9).fill(''));
  const [scores, setScores] = useState({
    X: 0,
    O: 0
  })
  // X will always start first
  const [xIsNext, setXIsNext] = useState(true); 
  const [draw, setDraw] = useState(false);
  const winner = calculateWinner(gameState);
  const xO = xIsNext ? "X" : "O";

  const handleClick = (i) => {
    const squares = [...gameState];
    // return if someone has won or square is occupied
    if (winner || squares[i]) return;
    // select square since no one has won and square is not occupied
    squares[i] = xO;
    setGameState(squares);
    const didSomeoneWin = calculateWinner(squares);
    //if someone won, then update winner count table
    if (didSomeoneWin){
      const currentScores = {...scores};
      currentScores[didSomeoneWin] += 1;
      putScores(currentScores); //update scores in database
      setScores(currentScores);
    }
    //check if draw no winner all squares filled && no winner
    if (!squares.some((el) => !el ) && !didSomeoneWin) {
      setDraw(true);
      return;
    }
    putGameState(squares);
    setXIsNext(!xIsNext);
  };

  const newGame = () => {
    setGameState(Array(9).fill(''));
    putGameState(Array(9).fill('')); //store empty gamestate in database
    setXIsNext(true);
    setDraw(false);
  }

  useEffect(() => {
    getGameState()
    .then( res => res.json())
    .then( data => {
      const obj = data.data[0];
      const gameStateArray = [obj['square_zero'], obj['square_one'], obj['square_two'], obj['square_three'], obj['square_four'], obj['square_five'], obj['square_six'], obj['square_seven'], obj['square_eight']];
      setGameState(gameStateArray);
    })
    
    getScores()
    .then (res => res.json())
    .then ( data => { 
      const {X, O} = data.data[0];
      setScores({X, O})
    })

  }, [])

  return (
    <>
      <GlobalStyles/>
      <Board squares={gameState} onClick={handleClick} />
      <Container>
        <h3>{draw? "Draw Game" : (winner ? "Winner: " + winner : "Next Player: " + xO)}</h3>
        <button onClick={newGame}>
          Start new game
        </button>
      </Container>
      <Container>
        <h3>Win counter: X={scores.X} O={scores.O}</h3>
      </Container>
    </>
  );
};

export default Game;
