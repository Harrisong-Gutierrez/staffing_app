import { NextResponse } from "next/server";
import { prisma } from "@/app/libs/prisma";

export async function GET() {
    try {
        const subscriptioncontent = await prisma.subscriptionContent.findMany();

        return NextResponse.json(subscriptioncontent);
    } catch (error) {
        console.error('Error fetching company details:', error);
        return NextResponse.json({ error: 'Failed to fetch company details' }, { status: 500 });
    }
}
