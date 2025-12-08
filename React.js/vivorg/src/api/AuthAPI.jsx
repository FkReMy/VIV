/* eslint-disable react-refresh/only-export-components */
/* eslint-disable no-unused-vars */
// TODO: Replace with Azure AD B2C authentication
// Placeholder implementations for Azure migration

export const LoginAPI = async (email, password) => {
    // TODO: Implement Azure AD B2C login
    console.warn('LoginAPI: Azure authentication not yet implemented');
    throw new Error('Authentication service not configured');
};

export const RegisterAPI = async (email, password) => {
    // TODO: Implement Azure AD B2C registration
    console.warn('RegisterAPI: Azure authentication not yet implemented');
    throw new Error('Authentication service not configured');
};

export const GoogleSignInAPI = async () => {
    // TODO: Implement Azure AD B2C social login (Google)
    console.warn('GoogleSignInAPI: Azure authentication not yet implemented');
    throw new Error('Authentication service not configured');
};

export const onLogout = async () => {
    // TODO: Implement Azure AD B2C logout
    console.warn('onLogout: Azure authentication not yet implemented');
    localStorage.removeItem('userEmail');
    return Promise.resolve();
};

export const onAuthStateChanged = (callback) => {
    // TODO: Implement Azure AD B2C auth state monitoring
    // For now, check localStorage
    const userEmail = localStorage.getItem('userEmail');
    if (userEmail) {
        callback({ accessToken: 'placeholder' });
    } else {
        callback(null);
    }
};
