import { NextResponse } from "next/server";
import { prisma } from "@/app/libs/prisma";

export async function GET() {
    try {
        const service = await prisma.service.findMany();

        return NextResponse.json(service);
    } catch (error) {
        console.error('Error fetching service:', error);
        return NextResponse.json({ error: 'Failed to fetch service' }, { status: 500 });
    }
}
