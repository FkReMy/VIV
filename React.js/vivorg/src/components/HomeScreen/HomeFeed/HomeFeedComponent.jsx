import React from 'react';
import Button from 'react-bootstrap/esm/Button';
import ThemeProvider from 'react-bootstrap/ThemeProvider';


export default function HomeFeedComponent() {
    return (
        <ThemeProvider
            breakpoints={['xxxl', 'xxl', 'xl', 'lg', 'md', 'sm', 'xs', 'xxs']}
            minBreakpoint="xxs">
            <section className="go_courses">
                <div>
                    <p>Start Now!</p>
                    <Button className='btn'>Learn more</Button>
                </div>
            </section>
        </ThemeProvider >
    )
}