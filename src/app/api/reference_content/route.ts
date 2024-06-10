import { NextResponse } from "next/server";
import { prisma } from "@/app/libs/prisma";

export async function GET() {
    try {
        const referenceContent = await prisma.referenceContent.findMany();

        return NextResponse.json(referenceContent);
    } catch (error) {
        console.error('Error fetching Reference Content:', error);
        return NextResponse.json({ error: 'Failed to fetch Reference Content' }, { status: 500 });
    }
}

