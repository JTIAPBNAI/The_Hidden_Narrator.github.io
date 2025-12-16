# The Hidden Narrator Repository

โค้ดเริ่มต้นสำหรับการสร้าง AI GhostWriting Machine จากหนังสือ

---
## การติดตั้งเพื่อเริ่มต้นใช้งาน
 - ให้ทำการ download หรือ copy ไฟล์ ini_project.sh ไปยังโฟล์เดอร์โปรเจคหนังสือที่จะเขียน - The_Hidden_Narrator.github.io/init_project.sh
 - เปิดโปรแกรม terminal (mac) ไปยังไดเรคทอรี่ของโฟล์เดอร์โปรเจคหนังสือนั้น
 - พิมพ์ ./init_project.sh
 - โปรแกรมจะถามชื่อหนังสือที่เราจะเขียน ให้ใส่ชื่อหนังสือที่จะเขียน หรือชื่อโปรเจค - Project Name (folder name) [my-book-project]:ให้พิมพ์ชื่อแล้ว กด enter
 - โปรแกรมจะถามเป้าหมาย หรือ บอกว่าหนังสือที่จะเขียนเกี่ยวกับอะไร - Book Goal (What is this book about?) [Write a book that empowers ordinary people to become authors using AI]: ตรงนี้ถ้าเรามีแนวทางหรือ concept หลักของหนังสือ สามารถพิมพ์ใส่ได้เลย แล้ว กด enter
 - โปรแกรมจะถามบทบาทที่จะให้ AI เป็น AI Role - (e.g., Ghost Writer, Research Assistant) [Ghost Writer & System Architect]: อยากจะให้ AI สวมบทบาทไหน สามารถพิมพ์ได้ หรือ กด enter เพื่อใช้ค่าเริ่มต้น
 - โปรแกรมจะถาม Persona ของนักเขียนที่เราอยากให้ AI เป็น -  Persona (Who should the AI emulate?)
   Ex: 'Adam Grant x Paul Krugman' or 'Malcolm Gladwell x Tim Ferriss' > เราสามารถใส่ชื่อนักเขียนที่เราอยากให้ AI เลียนแบบสำนวนการเขียนของนักเขียนที่เราชื่นชอบ พิมพ์แล้วกด enter
 - โปรแกรมจะถาม โทนการเขียนของเรา ว่าจะให้เป็นแบบไหน - Tone & Voice
   Ex: 'Conversational Thai, Humble Authority' or 'Academic English, Evidence-Based'
   > สามารถระบุให้ เขียนแบบนักวิชาการ, เขียนแบบไม่เป็นทางการ, เขียนแบบมีงานวิจัยอ้างอิง, ฯลฯ แล้วกด enter
 - โปรแกรมจะถาม ภาษาที่ใช้ในการเขียน - Primary Language [Thai (ภาษาไทย)]: ระบุภาษา และกด enter
 - โปรแกรมจะถาม อยากให้สร้างโครงสร้างของแต่ละบทไหม - Create sample chapter structure? (y/n) [y]: ถ้าต้องการให้กด enter

โปรแกรมจะทำการสร้างโฟล์เดอร์และไฟล์ทั้งหมดสำหรับการเริ่มต้นการเขียน

---
## การใช้งานในโปรแกรม IDE อย่าง Google Antigravity (สามารถใช้ Microsoft Visual Studio Code ได้เช่นกัน)
 - ดาวโหลดโปรแกรม Google Antigravity ได้ที่ https://antigravity.google/download
 - ทำการติดตั้ง
 - เปิดโปรแกรม และเลือก Open Folder แล้วเลือกไปยัง โฟล์เดอร์โปรเจคที่จะเขียน
 - เมื่อเปิดแล้วจะเห็นรายชื่อโฟล์เดอร์และไฟล์ต่าง ๆ ที่โปรแกรม init_project.sh สร้างให้ในหน้าต่าง Explorer ด้านซ้ายมือ
 - สามารถพิมพ์คำสั่ง Prompt เพื่อเริ่มการเขียนหนังสือได้ในช่อง chat กับ Agent ในหน้าต่างขวามือ

---
## คำแนะนำ
 - หลังจากสร้างโปรเจคเริ่มต้นด้วย init_project.sh แล้ว ในโฟล์เดอร์ TopBun ให้สร้างไฟล์แต่ละบท เป็นนามสกุล .md และเขียนโครงร่างของแต่ละบทคร่าว ๆ เพื่อใช้เป็นไฟล์เริ่มต้น
 - สามารถใช้ chatGPT ในการร่าง outline และ concept ของหนังสือคร่าว ๆ มาใส่ในโฟล์เดอร์ resources และตั้งชื่อเป็น outline.md
 - เราสามารถเริ่มสั่งให้ AI Agent ทำงานในหน้าต่าง chat เช่น
   Prompt: ใช้ @startprompt.md @README.md @GEMINI.md ในการทำความเข้าใจโปรเจคการเขียนหนังสือเล่มนี้
   โดยให้ศึกษา outline ของหนังสือจาก @resources/outline.md และโครงร่างจาก @TopBun/Chapter1.md เพื่อเริ่มเขียนบทที่ 1 สามารถใช้ @directives/04_research_protocol.md
   สำหรับการค้นคว้าข้อมูลเพิ่มเติมประกอบการเขียน
 - เมื่อ AI เขียนแล้ว ไฟล์ที่เขียนจะอยู่ในโฟล์เดอร์ drafts 
