import React from 'react';
import { IonSearchbar } from '@ionic/react';

function Search() {
    return (
        <>
            <IonSearchbar autocapitalize='on' placeholder='Search...' showClearButton="focus"></IonSearchbar>
        </>
    );
}
export default Search;