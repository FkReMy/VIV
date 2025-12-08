import { useNavigate } from "react-router-dom";

// eslint-disable-next-line react-hooks/rules-of-hooks
let instance = useNavigate();

export const navigate = (param) => {
    instance(param);
};