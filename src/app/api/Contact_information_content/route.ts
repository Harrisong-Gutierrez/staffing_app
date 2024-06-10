import { NextResponse } from "next/server";
import { prisma } from "@/app/libs/prisma";

export async function GET() {
    try {
        const contactInformationContent = await prisma.contactInformationContent.findMany();

        return NextResponse.json(contactInformationContent);
    } catch (error) {
        console.error('Error fetching contact Information Content:', error);
        return NextResponse.json({ error: 'Failed to fetch contact Information Content' }, { status: 500 });
    }
}

