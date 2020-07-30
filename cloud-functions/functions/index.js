'use strict';

const functions = require('firebase-functions');
const nodemailer = require('nodemailer');
const mailTransport = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'zbrapasteltest1@gmail.com',
    pass: 'zpastelTest',
  },
});

const APP_NAME = 'ZPastel';

// [START sendWelcomeEmail]
/**
 * Sends a welcome email to new user.
 */
// [START onCreateTrigger]
exports.sendWelcomeEmail = functions.auth.user().onCreate((user) => {
// [END onCreateTrigger]
  // [START eventAttributes]
  const email = user.email; // The email of the user.
  const displayName = user.displayName; // The display name of the user.
  // [END eventAttributes]

  return sendWelcomeEmail(email, displayName);
});
// [END sendWelcomeEmail]

// [START sendByeEmail]
/**
 * Send an account deleted email confirmation to users who delete their accounts.
 */
// [START onDeleteTrigger]
exports.sendByeEmail = functions.auth.user().onDelete((user) => {
// [END onDeleteTrigger]
  const email = user.email;
  const displayName = user.displayName;

  return sendGoodbyeEmail(email, displayName);
});
// [END sendByeEmail]

// Sends a welcome email to the given user.
async function sendWelcomeEmail(email, displayName) {
  const mailOptions = {
    from: `${APP_NAME} <noreply@zpastel.com>`,
    to: email,
  };

  // The user subscribed to the newsletter.
  mailOptions.subject = `Welcome to ${APP_NAME}!`;
  mailOptions.text = `Hey ${displayName || ''}! Welcome to ${APP_NAME}. I hope you will enjoy our service.`;
  await mailTransport.sendMail(mailOptions);
  console.log('New welcome email sent to:', email);
  return null;
}

// Sends a goodbye email to the given user.
async function sendGoodbyeEmail(email, displayName) {
  const mailOptions = {
    from: `${APP_NAME} <noreply@zpastel.com>`,
    to: email,
  };

  // The user unsubscribed to the newsletter.
  mailOptions.subject = `Bye!`;
  mailOptions.text = `Hey ${displayName || ''}!, We confirm that we have deleted your ${APP_NAME} account.`;
  await mailTransport.sendMail(mailOptions);
  console.log('Account deletion confirmation email sent to:', email);
  return null;
}

exports.sendMail = functions.firestore
    .document('Order/{orderId}')
    .onCreate(async (snap, context) => {
  
    const orderData = snap.data();

    var orderItems = '';
    orderData.items.forEach((item) => {
        console.log(item);
        orderItems =  `${orderItems}
                        <tr>
                            <td class="order-detail__cell">${item.qtdy}</td>
                            <td class="order-detail__cell">${item.flavor.name}</td>
                            <td class="order-detail__cell" colspan=2>${item.extraInformation}</td>
                        </tr>`;
    });

    const mailOptions = {
        from: `${APP_NAME} <noreply@zpastel.com>`,
        to: 'jose.luz@zbra.com.br',
        subject: `Novo Pedido!!! Usuário ${orderData.createdByUsername}`,
        html: `<html xmlns="http://www.w3.org/1999/xhtml">
               	<head>
               		<meta http-equiv="content-type" content="text/html; charset=utf-8">
               		<meta name="viewport" content="width=device-width, initial-scale=1.0;">
               		<meta name="format-detection" content="telephone=no"/>
               		<style>
                           html{
                               font-family: Arial, Helvetica, sans-serif;
                           }

                           .body{
                               width: 100%;
                               background-color: eee;
                           }
                           .header{
                               width: 100%;
                               background-color: rgba(250, 85, 85, 1);
                               margin-bottom: 20px;
                               padding: 20px 50px;
                               align-content: center;
                               vertical-align: middle;
                               display: flex;
                           }

                           .title{
                               color: white;
                               font-size: 50px;
                               margin-left: 20px;
                               text-align: center;
                           }

                           .logo{
                               width: 60px;
                               height: 60px;
                           }

                           .email-body{
                               padding: 5px 50px;
                               font-size: 15px;
                               color: #666;
                               display: flex;
                               flex-flow: column;
                           }

                           .order-requester {
                               font-size: 25px;
                           }

                           .separator-vertical {
                               height: 15px;
                           }
               		</style>
               	</head>

               	<body width="100%" class="body">
                       <div class="header">
                           <span class="title">ZPastel</span>
                       </div>

                       <div class="email-body">
                           <span class="order-requester">Novo Pedido de(a) ${orderData.createdByUsername}</span>
                           <br><br>
                           <div class="separator-vertical"></div>
                           <span>Pedido feito as ${orderData.createdOn}</span>
                           <br><br>
                           <div class="separator-vertical"></div>
                           <table class="orders-details">
                               <thead>
                                   <th class="order-detail__header">Qtde</th>
                                   <th class="order-detail__header">Sabor</th>
                                   <th class="order-detail__header" colspan=2>Observação</th>
                               </thead>
                               <tbody>
                                   ${orderItems}
                               </tbody>
                            </table>
                       </div>
               	</body>
           </html>`
    };

    await mailTransport.sendMail(mailOptions);
    return null;
});
