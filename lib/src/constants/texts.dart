const loremIpsum = '''
Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem 
aperiam, eaque ipsa quae ab illo 
inventore veritatis et quasi architecto beatae vitae dicta sunt 

explicabo. Nemo enim ipsam 
voluptatem quia voluptas sit aspernatur aut odit aut 
fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. 
''';
const categoryNBList = [
'১. টাইমার প্রযোজ্য আইটেমের ক্ষেত্রে নির্দিষ্ট সময়ের ভিতরে অর্ডার প্লেস করতে হবে, নয়তো অর্ডার বাতিল কিংবা পরবর্তী নির্ধারিত সময়ে ডেলিভার করা হবে।',
'২. প্যাকেজ ব্যতীত কোন নির্দিষ্ট আইটেমের জন্য ডেলিভারি বাবদ ১০ টাকা ডেলিভারি চার্জ প্রদান করতে হবে। তবে গ্রাহক যদি মাহুলি অথবা ডেইলি প্যাকেজ ইউজার হয় কিংবা নিয়মিত গ্রাহক হয়,সে ক্ষেত্রে ডেলিভারি চার্জ প্রযোজ্য হবে না৷',
'৩. ম্নেকস্‌ , ডেজার্ট, এবং স্পেশাল আইটেমের ক্ষেত্রে স্টক থাকা সাপেক্ষে টাইমার ব্যতীত আমাদের সার্ভিস আওয়ারে ভিতরে যেকোনো সময় অর্ডার করা যাবে।'
];
const packagesNBList = [
'* ডেইলি প্যাকেজ ওয়ান টাইম অর্ডারের আওতাধীন, সে ক্ষেত্রে প্রতিদিন যদি আপনি ডেইলি প্যাকেজ নিতে চান তাহলে আপনাকে প্রতিদিন অর্ডার করতে হবে। ডেইলি প্যাকেজে অর্ডার অটোমেটিক্যালি রিজেনেরেট হয়না',
'* মাহ্থুলি প্যাকেজ নিলে আপনাকে প্রতিদিন অর্ডার জেনারেট করতে হবে না, শুধু প্রথমবার প্যাকেজ কেনার পর থেকে প্রতিদিন আপনার অর্ডার অটোমেটিক্যালি জেনারেট হবে।'
];
