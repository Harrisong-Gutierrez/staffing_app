import { NextResponse } from "next/server";
import { prisma } from "@/app/libs/prisma";





export async function GET() {
    try {
        const companyDetailsContentType = await prisma.companyDetailsContent.findMany();

        return NextResponse.json(companyDetailsContentType);
    } catch (error) {
        console.error('company Details Content', error);
        return NextResponse.json({ error: 'Failed to fetch company Details Content' }, { status: 500 });
    }
}

