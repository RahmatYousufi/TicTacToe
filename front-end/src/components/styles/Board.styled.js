import styled from "styled-components";

//repeat(number of columns/rows, the column width we want);
export const StyledBoard = styled.div`
    border: 1rem;
    background: black;
    width: 50vw;
    height: 60vh;
    display: grid;
    grid-template: repeat(3, 1fr) / repeat(3, 1fr); 
    gap: 1rem;
`
