import React from 'react';
import { IonDatetime, IonTitle } from '@ionic/react';
import { useParams } from 'react-router';
import './main.css';

function Calendar() {
    return <IonDatetime size='cover'></IonDatetime>;
}
export default Calendar;