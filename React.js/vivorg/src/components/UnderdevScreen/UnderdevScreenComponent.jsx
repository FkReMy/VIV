import React from "react";
import vivw from '../../assets/Pics/vivw.png'
import "./UnderdevScreenComponent.scss";
import Image from 'react-bootstrap/Image'
import ThemeProvider from 'react-bootstrap/ThemeProvider';


export default function UnderdevScreenComponent() {
    return (
        <ThemeProvider
            breakpoints={['xxxl', 'xxl', 'xl', 'lg', 'md', 'sm', 'xs', 'xxs']}
            minBreakpoint="xxs">
            <div className="UnderdevScreen-wrapper">
                <div className="UnderdevScreen">
                    <Image className="loading-logo" src={vivw} fluid />
                    <div className="loading"></div>
                    <div className="loading-devalart">
                        <h1>Under Development</h1>
                    </div>
                </div>
            </div>
        </ThemeProvider >
    )
}
