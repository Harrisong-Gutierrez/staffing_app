import { NextResponse } from "next/server";
import { prisma } from "@/app/libs/prisma";


export async function GET() {
    try {
        const CompanyDetailsContent = await prisma.companyDetailsContent.findMany();

        return NextResponse.json(CompanyDetailsContent);
    } catch (error) {
        console.error('Error fetching company details content:', error);
        return NextResponse.json({ error: 'Failed to fetch company details content' }, { status: 500 });
    }
}
