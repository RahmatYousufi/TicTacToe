import { createGlobalStyle } from "styled-components";

const GlobalStyles = createGlobalStyle`
    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }
    
    body {
        display: flex;
        justify-content: center;
        height: 100vh;
        padding: 2rem;
    }
    
    h1 {
        margin: 2rem;
    }
    
    h3 {
        padding: 1rem;
    }
`

export default GlobalStyles;