import React from "react";
import { StyledSquare } from "./styles/Square.styled";

const Square = ({ value, onClick }) => {

  return (
    <StyledSquare onClick={onClick}>
      {value}
    </StyledSquare>
  );
};

export default Square;
