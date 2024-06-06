import { NextResponse } from "next/server";
import { prisma } from "@/app/libs/prisma";





export async function GET() {
    try {
        const serviceContent = await prisma.serviceContent.findMany();

        return NextResponse.json(serviceContent);
    } catch (error) {
        console.error('Error fetching service Content:', error);
        return NextResponse.json({ error: 'Failed to fetch service Content' }, { status: 500 });
    }
}

