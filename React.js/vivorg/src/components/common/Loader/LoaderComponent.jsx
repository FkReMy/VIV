import React from "react";
import "./LoaderComponent.scss";

export default function LoaderComponent(){
        return (
            <div className="Loader-wrapper">
                <div className="Loader">
                    <div className="loading"></div>
                    <div className="loading-devalart">
                        <h1>Loading Please Wait</h1>
                    </div>
                </div>
            </div>
        )
}
