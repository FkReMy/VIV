import React from "react";
import Login from "./Login/Login";
import UnSignScreensNav from "../UnSignScreensNav/UnSignScreensNav";
import ThemeProvider from 'react-bootstrap/ThemeProvider';

export default function LoginLayout() {
    return (

        <ThemeProvider
            breakpoints={['xxxl', 'xxl', 'xl', 'lg', 'md', 'sm', 'xs', 'xxs']}
            minBreakpoint="xxs">
            <div>
                <UnSignScreensNav />
                <Login />
            </div>
        </ThemeProvider >
    );

}