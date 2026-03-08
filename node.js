// server.js - Jembatan Kegelapan (Ghost Proxy)
const axios = require('axios');

export default async function handler(req, res) {
    const { target, payload, key } = req.body;

    // Protokol Keamanan Captain CALEB
    if (key !== "111") return res.status(403).json({ status: "REJECTED", msg: "ZEHAHAHA! Kau penyusup!" });

    try {
        // MASKING: Kirim lewat API Gateway (Ganti pake Token & Instance ID lu)
        const GATEWAY_URL = `https://api.ultramsg.com/instanceXXXX/messages/chat`;
        await axios.post(GATEWAY_URL, {
            token: "YOUR_TOKEN_HERE",
            to: target,
            body: payload
        });

        // SELF-DESTRUCT: Hapus log request dari variabel lokal/console
        console.clear(); 
        console.log("[🛡️] LOG DESTRUCTED: No trace left in the Abyss.");

        return res.status(200).json({ status: "GACOR", msg: "Target swallowed. IP Masked." });
    } catch (err) {
        return res.status(500).json({ status: "ERROR", msg: "Cahaya terlalu kuat!" });
    }
}
