import React from "react";
import Register from "./Register/Register";
import UnSignScreensNav from "../UnSignScreensNav/UnSignScreensNav";
import ThemeProvider from 'react-bootstrap/ThemeProvider';

export default function RegisterLayout() {
    return (

        <ThemeProvider
            breakpoints={['xxxl', 'xxl', 'xl', 'lg', 'md', 'sm', 'xs', 'xxs']}
            minBreakpoint="xxs">
            <div>
                <UnSignScreensNav />
                <Register />
            </div>
        </ThemeProvider >
    );

}