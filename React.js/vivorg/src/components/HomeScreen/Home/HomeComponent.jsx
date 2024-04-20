import React from "react";
import vivbw from '../../../assets/Pics/vivbw.png';
import "./HomeComponent.scss";
import Image from 'react-bootstrap/Image';
import ThemeProvider from 'react-bootstrap/ThemeProvider';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Button from 'react-bootstrap/Button';

export default function HomeComponent() {
    return (
        <ThemeProvider
            breakpoints={['xxxl', 'xxl', 'xl', 'lg', 'md', 'sm', 'xs', 'xxs']}
            minBreakpoint="xxs">
            <section className="home-wrapper">
                <div>
                    <Image className="home-logo" src={vivbw} />
                    <Container className="home-details">
                        <Col>
                        <Row>
                        <h1 className="home-title"><strong>Support your Business.</strong></h1>
                        </Row>
                        <Row>
                        <p>Wherever you go, go with all your heart.</p>
                        </Row>
                        <Row>
                        <Button className="homebtn home-btn">Learn more</Button>
                        </Row>
                        </Col>
                    </Container>

                </div>

            </section>

        </ThemeProvider >
    )
}
