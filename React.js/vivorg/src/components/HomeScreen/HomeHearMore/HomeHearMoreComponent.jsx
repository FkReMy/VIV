import React from 'react';
import ThemeProvider from 'react-bootstrap/ThemeProvider';
import Container from 'react-bootstrap/Container';

export default function HomeHearMoreComponent() {
    return (
        <ThemeProvider
            breakpoints={['xxxl', 'xxl', 'xl', 'lg', 'md', 'sm', 'xs', 'xxs']}
            minBreakpoint="xxs">
            <section className="hear-more">
                <div className="buffer"></div>
                <h1>Hear more from our community.</h1>
            </section>
        </ThemeProvider >

    )
}
