import { NextResponse } from "next/server";
import { prisma } from "@/app/libs/prisma";

export async function GET() {
    try {
        const companyDetails = await prisma.companyDetails.findMany();

        return NextResponse.json(companyDetails);
    } catch (error) {
        console.error('Error fetching company details:', error);
        return NextResponse.json({ error: 'Failed to fetch company details' }, { status: 500 });
    }
}

