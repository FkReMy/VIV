import React, { useState } from 'react';
import "./SignedScreensNavComponent.scss"
import { useNavigate } from "react-router-dom";
import Button from 'react-bootstrap/Button';
import Navbar from 'react-bootstrap/Navbar';
import ThemeProvider from 'react-bootstrap/ThemeProvider';
import SignedScreensMenuComponent from "../SignedScreensMenu/SignedScreensMenuComponent";
import { 
    AiOutlineHome,
    AiOutlineUser,
    AiOutlineMessage,
    AiOutlineSearch,
    AiOutlineBell
} from 'react-icons/Ai';

export default function SignedScreensNavComponent() {
    let navigate = useNavigate();
    return (

        <ThemeProvider
            breakpoints={['xxxl', 'xxl', 'xl', 'lg', 'md', 'sm', 'xs', 'xxs']}
            minBreakpoint="xxs">
            <Navbar className='SignedScreensNavbar'>
                <Button className="SignedScreensNavlogo" onClick={() => navigate('/')}>V I V</Button>
                <AiOutlineHome size={35} className='SignedScreensNavbaricons' onClick={() => navigate('/feed')}/>
                <AiOutlineSearch size={35} className='SignedScreensNavbaricons' />
                <AiOutlineBell size={35} className='SignedScreensNavbaricons' />
                <AiOutlineMessage size={35} className='SignedScreensNavbaricons' />
                <AiOutlineUser size={35} className='SignedScreensNavbaricons' onClick={() => navigate('/profile')}/>
                <div className='nav'>
                    <>
                        {['end'].map((Menu, idx) => (
                            <SignedScreensMenuComponent key={idx} placement={Menu} name={Menu} />
                        ))}
                    </>
                </div>
            </Navbar>
        </ThemeProvider >
    )
}

