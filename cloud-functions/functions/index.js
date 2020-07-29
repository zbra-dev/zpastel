'use strict';

const functions = require('firebase-functions');
const nodemailer = require('nodemailer');
const mailTransport = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'zbrapastel@gmail.com',
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
  
    const orderData = snap.data()
    console.log(`Data: ${orderData}`)
    console.log(`Username: ${orderData.createdByUsername}`)

    const mailOptions = {
        from: `${APP_NAME} <noreply@zpastel.com>`,
        to: 'jayme.preto@zbra.com.br',
        subject: `Novo Pedido!!! Usuário ${orderData.createdByUsername}`,
        html: `<html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <meta http-equiv="content-type" content="text/html; charset=utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0;">
                <meta name="format-detection" content="telephone=no"/>
        
            <!-- Responsive Mobile-First Email Template by Konstantin Savchenko, 2015.
            https://github.com/konsav/email-templates/  -->
        
            <style>
        /* Reset styles */ 
        body { margin: 0; padding: 0; min-width: 100%; width: 100% !important; height: 100% !important;}
        body, table, td, div, p, a { -webkit-font-smoothing: antialiased; text-size-adjust: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; line-height: 100%; }
        table, td { mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse !important; border-spacing: 0; }
        img { border: 0; line-height: 100%; outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; }
        #outlook a { padding: 0; }
        .ReadMsgBody { width: 100%; } .ExternalClass { width: 100%; }
        .ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }
        
        /* Rounded corners for advanced mail clients only */ 
        @media all and (min-width: 560px) {
            .container { border-radius: 8px; -webkit-border-radius: 8px; -moz-border-radius: 8px; -khtml-border-radius: 8px; }
        }
        
        /* Set color for auto links (addresses, dates, etc.) */ 
        a, a:hover {
            color: #FFFFFF;
        }
        .footer a, .footer a:hover {
            color: #828999;
        }
        
                </style>
        
        </head>
        
        <!-- BODY -->
        <!-- Set message background color (twice) and text color (twice) -->
        <body topmargin="0" rightmargin="0" bottommargin="0" leftmargin="0" marginwidth="0" marginheight="0" width="100%" style="border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; width: 100%; height: 100%; -webkit-font-smoothing: antialiased; text-size-adjust: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; line-height: 100%;
            background-color: #fa5555;
            color: #FFFFFF;"
            bgcolor="#fa5555"
            text="#FFFFFF">
        
        <!-- SECTION / BACKGROUND -->
        <!-- Set message background color one again -->
        <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; width: 100%;" class="background"><tr><td align="center" valign="top" style="border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0;"
            bgcolor="#fa5555">
        
        <!-- WRAPPER -->
        <!-- Set wrapper width (twice) -->
        <table border="0" cellpadding="0" cellspacing="0" align="center"
            width="500" style="border-collapse: collapse; border-spacing: 0; padding: 0; width: inherit;
            max-width: 500px;" class="wrapper">
            
                <!-- HERO IMAGE -->
            <!-- Image text color should be opposite to background color. Set your url, image src, alt and title. Alt text should fit the image size. Real image size should be x2 (wrapper x2). Do not set height for flexible images (including "auto"). URL format: http://domain.com/?utm_source={{Campaign-Source}}&utm_medium=email&utm_content={{Ìmage-Name}}&utm_campaign={{Campaign-Name}} -->
            <tr>
                <td align="center" valign="top" style="border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0;
                    padding-top: 0px;" class="hero"><a target="_blank" style="text-decoration: none;"><img border="0" vspace="0" hspace="0"
                    width="120" style="
                    width: 30%%;
                    max-width: 120px;
                    color: #FFFFFF; font-size: 13px; margin: 0; padding: 0; outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; border: none; display: block;"/></a></td>
            </tr>
        
            <!-- HEADER -->
            <!-- Set text color and font family ("sans-serif" or "Georgia, serif") -->
            <tr>
                <td id="order-header" align="center" valign="top" style="border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0;  padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; font-size: 24px; font-weight: bold; line-height: 130%;
                    padding-top: 5px;
                    color: #FFFFFF;
                    font-family: sans-serif;" class="header">
                        Novo Pedido de ${orderData.createdByUsername}
                </td>
            </tr>
        
            <!-- PARAGRAPH -->
            <!-- Set text color and font family ("sans-serif" or "Georgia, serif"). Duplicate all text styles in links, including line-height -->
            <tr>
                <td align="center" valign="top" style="border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; font-size: 17px; font-weight: 400; line-height: 160%;
                    padding-top: 15px; 
                    color: #FFFFFF;
                    font-family: sans-serif;" class="paragraph">
                        Item Description.
                </td>
                <td align="center" valign="top" style="border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0;
                    padding-top: 0px;" class="hero"><a target="_blank" style="text-decoration: none;"
                    href="https://github.com/konsav/email-templates/"><img border="0" vspace="0" hspace="0"
                    src="https://raw.githubusercontent.com/konsav/email-templates/master/images/hero-block.png"
                    alt="Please enable images to view this content" title="Hero Image"
                    width="340" style="
                    width: 87.5%;
                    max-width: 340px;
                    color: #FFFFFF; font-size: 13px; margin: 0; padding: 0; outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; border: none; display: block;"/></a></td>

            </tr>
        
            <!-- LINE -->
            <!-- Set line color -->
            <tr>
                <td align="center" valign="top" style="border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%;
                    padding-top: 30px;" class="line"><hr
                    color="#565F73" align="center" width="100%" size="1" noshade style="margin: 0; padding: 0;" />
                </td>
            </tr>
        
        <!-- End of WRAPPER -->
        </table>
        
        <!-- End of SECTION / BACKGROUND -->
        </td></tr></table>
        
        </body>
        </html>`
    };

    // returning result
    // return transporter.sendMail(mailOptions, (erro, info) => {
    //     if(erro){
    //         return res.send(erro.toString());
    //     }
    //     return res.send('Sended');
    // });

    console.log('order email sent to:', mailOptions);
    await mailTransport.sendMail(mailOptions);
    return null;
});    