import React from 'react';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import ThemeProvider from 'react-bootstrap/ThemeProvider';

export default function HomeBoxesComponent() {
    return (
        <ThemeProvider
            breakpoints={['xxxl', 'xxl', 'xl', 'lg', 'md', 'sm', 'xs', 'xxs']}
            minBreakpoint="xxs">
            <div className="boxes">
                <>
                <Col className="box light"><div className="title">
                    <h1>Want to start?</h1>
                </div>
                    <div className="details">
                        <p>We’ve had an incredible response so far, and are doing everything we can to respond to everyone who wants to start his Business and be on one of our community programs.</p>
                    </div>
                    <div className="button">
                        <a className="btn">Get involved</a>
                    </div>
                </Col>
                <Col className="box dark"> <div className="title">
                    <h1>Are you an Organization?</h1>
                </div>
                    <div className="details">
                        <p>We are uniting our resources around this challenge, and we are combining our resources and asks to make it easy for people to support their communities.</p>
                    </div>
                    <div className="button">
                        <a className="btn">Get involved</a>
                    </div>
                </Col>
                </>
            </div>
        </ThemeProvider >

    )
}
