/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


/* global bootstrap */

function initAutoCloseAlert(alertId, progressId, totalTime = 5000) {
    const intervalTime = 50;
    let elapsed = 0;

    const progress = document.getElementById(progressId);
    const alertBox = document.getElementById(alertId);

    if (!progress || !alertBox) return;

    const timer = setInterval(() => {
        elapsed += intervalTime;
        const remaining = Math.max(0, 100 - (elapsed / totalTime) * 100);
        progress.style.width = `${remaining}%`;

        if (elapsed >= totalTime) {
            clearInterval(timer);
            if (bootstrap && bootstrap.Alert) {
                const bsAlert = new bootstrap.Alert(alertBox);
                bsAlert.close();
            }
        }
    }, intervalTime);
}

        
    