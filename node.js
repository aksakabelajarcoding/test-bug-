// server.js - Jantung Kegelapan
const express = require('express');
const axios = require('axios');
const cors = require('cors');
const app = express();

app.use(express.json());
app.use(cors()); // Izinkan Portofolio Web lu ngirim data

const PORT = 3000;
const GATEWAY_URL = "https://api.ultramsg.com/instanceXXXX/messages/chat";
const TOKEN = "YOUR_SECRET_TOKEN_111"; // Ganti dengan Token API lu

app.post('/api/quaken-impact', async (req, res) => {
    const { target, message, key } = req.body;

    // Protokol Keamanan: Cuma Captain CALEB yang punya Key 111
    if (key !== "111") {
        return res.status(403).json({ status: "DENIED", msg: "ZEHAHAHA! Kau bukan kaptenku!" });
    }

    try {
        const response = await axios.post(GATEWAY_URL, {
            token: TOKEN,
            to: target,
            body: `[🌑 VOID SYSTEM REPORT]\n\nTARGET: CRITICAL BUG\nINFO: ${message}\n\nZEHAHAHA! Kegelapan telah menelanmu. ☠️`
        });

        res.json({ status: "GACOR", msg: "Pesan telah ditelan kegelapan!" });
    } catch (error) {
        res.status(500).json({ status: "FAILED", msg: "Cahaya terlalu kuat, coba lagi!" });
    }
});

app.listen(PORT, () => console.log(`[BLACKBEARD] Server Online di Port ${PORT}. ZEHAHAHA!`));
