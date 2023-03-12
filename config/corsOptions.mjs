const corsOptions = {
    origin: ['http://localhost:3000', 'http://localhost:5173'],
    methods: ['GET', 'PUT', 'POST', 'DELETE', 'PATCH'],
    // allowedHeaders: ['Content-Type', 'Authorization'],
    optionsSuccessStatus: 200,
    credentials: true,
    exposedHeaders: ['*', 'Authorization'],
    preflightContinue: false
}

export default corsOptions;