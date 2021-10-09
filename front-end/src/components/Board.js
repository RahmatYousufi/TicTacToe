import React from 'react';
import Square from './Square';
import { StyledBoard } from './styles/Board.styled';

const Board = ({squares, onClick}) => {
    return (
        <StyledBoard>
            {squares.map((square, i) => (
                <Square key={i} value={square} onClick={() => onClick(i)}/>
            ))}
        </StyledBoard>
    )
}

export default Board
