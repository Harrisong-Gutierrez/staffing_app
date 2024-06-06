import { NextResponse } from "next/server";
import { prisma } from "@/app/libs/prisma";





export async function GET() {
    try {
        const page = await prisma.page.findMany();

        return NextResponse.json(page);
    } catch (error) {
        console.error('Error fetching page', error);
        return NextResponse.json({ error: 'Failed to fetch page' }, { status: 500 });
    }
}

