import React, { useState } from 'react';
import "./UnSignScreensNavComponent.scss"
import { useNavigate } from "react-router-dom";
import Button from 'react-bootstrap/Button';
import Navbar from 'react-bootstrap/Navbar';
import ThemeProvider from 'react-bootstrap/ThemeProvider';
import Offcanvas from 'react-bootstrap/Offcanvas';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import UnSignScreensMenuComponent from "../UnSignScreensMenu/UnSignScreensMenuComponent";


export default function UnSignScreensNavComponent() {
    let navigate = useNavigate();
    return (

        <ThemeProvider
            breakpoints={['xxxl', 'xxl', 'xl', 'lg', 'md', 'sm', 'xs', 'xxs']}
            minBreakpoint="xxs">
            <Navbar className='unSignScreensNavbar'>
                <Button className="unSignScreensNavlogo" onClick={() => navigate('/')}>V I V</Button>
                <div className='nav'>
                    <>
                        {['end'].map((Menu, idx) => (
                            <UnSignScreensMenuComponent key={idx} placement={Menu} name={Menu} />
                        ))}
                    </>
                </div>
            </Navbar>
        </ThemeProvider >
    )
}

