import React from "react";
import "./HomewaveComponent.scss";
import ThemeProvider from 'react-bootstrap/ThemeProvider';

export default function HomewaveComponent() {
    return (
        <ThemeProvider
            breakpoints={['xxxl', 'xxl', 'xl', 'lg', 'md', 'sm', 'xs', 'xxs']}
            minBreakpoint="xxs">
            
            <svg id="home-waves" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="#fff" fillOpacity="1" d="M0,160L48,149.3C96,139,192,117,288,144C384,171,480,245,576,240C672,235,768,149,864,96C960,43,1056,21,1152,48C1248,75,1344,149,1392,186.7L1440,224L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>

        </ThemeProvider >
    )
}
