namespace DataModelApplication
{
    partial class test
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tabControl1 = new TD.SandDock.TabControl();
            this.sandBarManager1 = new TD.SandBar.SandBarManager();
            this.leftSandBarDock = new TD.SandBar.ToolBarContainer();
            this.rightSandBarDock = new TD.SandBar.ToolBarContainer();
            this.bottomSandBarDock = new TD.SandBar.ToolBarContainer();
            this.topSandBarDock = new TD.SandBar.ToolBarContainer();
            this.menuBar1 = new TD.SandBar.MenuBar();
            this.menuBarItem1 = new TD.SandBar.MenuBarItem();
            this.menuBarItem2 = new TD.SandBar.MenuBarItem();
            this.menuBarItem3 = new TD.SandBar.MenuBarItem();
            this.menuBarItem4 = new TD.SandBar.MenuBarItem();
            this.menuBarItem5 = new TD.SandBar.MenuBarItem();
            this.toolBar1 = new TD.SandBar.ToolBar();
            this.sandDockManager1 = new TD.SandDock.SandDockManager();
            this.leftSandDock = new TD.SandDock.DockContainer();
            this.rightSandDock = new TD.SandDock.DockContainer();
            this.bottomSandDock = new TD.SandDock.DockContainer();
            this.topSandDock = new TD.SandDock.DockContainer();
            this.dockControl1 = new TD.SandDock.DockControl();
            this.dockControl2 = new TD.SandDock.DockControl();
            this.topSandBarDock.SuspendLayout();
            this.rightSandDock.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Location = new System.Drawing.Point(0, 0);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.Renderer = new TD.SandDock.Rendering.MilborneRenderer();
            this.tabControl1.TabIndex = 0;
            // 
            // sandBarManager1
            // 
            this.sandBarManager1.BottomContainer = this.bottomSandBarDock;
            this.sandBarManager1.LeftContainer = this.leftSandBarDock;
            this.sandBarManager1.OwnerForm = this;
            this.sandBarManager1.RightContainer = this.rightSandBarDock;
            this.sandBarManager1.TopContainer = this.topSandBarDock;
            // 
            // leftSandBarDock
            // 
            this.leftSandBarDock.Dock = System.Windows.Forms.DockStyle.Left;
            this.leftSandBarDock.Location = new System.Drawing.Point(0, 47);
            this.leftSandBarDock.Manager = this.sandBarManager1;
            this.leftSandBarDock.Name = "leftSandBarDock";
            this.leftSandBarDock.Size = new System.Drawing.Size(0, 273);
            this.leftSandBarDock.TabIndex = 0;
            // 
            // rightSandBarDock
            // 
            this.rightSandBarDock.Dock = System.Windows.Forms.DockStyle.Right;
            this.rightSandBarDock.Location = new System.Drawing.Point(400, 47);
            this.rightSandBarDock.Manager = this.sandBarManager1;
            this.rightSandBarDock.Name = "rightSandBarDock";
            this.rightSandBarDock.Size = new System.Drawing.Size(0, 273);
            this.rightSandBarDock.TabIndex = 1;
            // 
            // bottomSandBarDock
            // 
            this.bottomSandBarDock.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.bottomSandBarDock.Location = new System.Drawing.Point(0, 320);
            this.bottomSandBarDock.Manager = this.sandBarManager1;
            this.bottomSandBarDock.Name = "bottomSandBarDock";
            this.bottomSandBarDock.Size = new System.Drawing.Size(400, 0);
            this.bottomSandBarDock.TabIndex = 2;
            // 
            // topSandBarDock
            // 
            this.topSandBarDock.Controls.Add(this.menuBar1);
            this.topSandBarDock.Controls.Add(this.toolBar1);
            this.topSandBarDock.Dock = System.Windows.Forms.DockStyle.Top;
            this.topSandBarDock.Location = new System.Drawing.Point(0, 0);
            this.topSandBarDock.Manager = this.sandBarManager1;
            this.topSandBarDock.Name = "topSandBarDock";
            this.topSandBarDock.Size = new System.Drawing.Size(400, 47);
            this.topSandBarDock.TabIndex = 3;
            // 
            // menuBar1
            // 
            this.menuBar1.Buttons.AddRange(new TD.SandBar.ToolbarItemBase[] {
            this.menuBarItem1,
            this.menuBarItem2,
            this.menuBarItem3,
            this.menuBarItem4,
            this.menuBarItem5});
            this.menuBar1.Guid = new System.Guid("3c6739c1-7db9-40fc-b195-92e6161cc60f");
            this.menuBar1.Location = new System.Drawing.Point(2, 0);
            this.menuBar1.Name = "menuBar1";
            this.menuBar1.Size = new System.Drawing.Size(398, 24);
            this.menuBar1.TabIndex = 0;
            // 
            // menuBarItem1
            // 
            this.menuBarItem1.Text = "&File";
            // 
            // menuBarItem2
            // 
            this.menuBarItem2.Text = "&Edit";
            // 
            // menuBarItem3
            // 
            this.menuBarItem3.Text = "&View";
            // 
            // menuBarItem4
            // 
            this.menuBarItem4.Text = "&Window";
            // 
            // menuBarItem5
            // 
            this.menuBarItem5.Text = "&Help";
            // 
            // toolBar1
            // 
            this.toolBar1.DockLine = 1;
            this.toolBar1.Guid = new System.Guid("14bc9ed5-4133-44ee-82c4-58a57f913e66");
            this.toolBar1.Location = new System.Drawing.Point(2, 24);
            this.toolBar1.Name = "toolBar1";
            this.toolBar1.Size = new System.Drawing.Size(25, 23);
            this.toolBar1.TabIndex = 1;
            this.toolBar1.Text = "toolBar1";
            // 
            // sandDockManager1
            // 
            this.sandDockManager1.OwnerForm = this;
            // 
            // leftSandDock
            // 
            this.leftSandDock.Dock = System.Windows.Forms.DockStyle.Left;
            this.leftSandDock.Guid = new System.Guid("3f6c1e26-0926-46ca-92e0-1b3884f82f49");
            this.leftSandDock.LayoutSystem = new TD.SandDock.SplitLayoutSystem(250, 400);
            this.leftSandDock.Location = new System.Drawing.Point(0, 47);
            this.leftSandDock.Manager = this.sandDockManager1;
            this.leftSandDock.Name = "leftSandDock";
            this.leftSandDock.Size = new System.Drawing.Size(0, 273);
            this.leftSandDock.TabIndex = 4;
            // 
            // rightSandDock
            // 
            this.rightSandDock.Controls.Add(this.dockControl1);
            this.rightSandDock.Controls.Add(this.dockControl2);
            this.rightSandDock.Dock = System.Windows.Forms.DockStyle.Right;
            this.rightSandDock.Guid = new System.Guid("be8dfb32-a758-46cc-8072-ed0412d57ed0");
            this.rightSandDock.LayoutSystem = new TD.SandDock.SplitLayoutSystem(250, 400, System.Windows.Forms.Orientation.Horizontal, new TD.SandDock.LayoutSystemBase[] {
            ((TD.SandDock.LayoutSystemBase)(new TD.SandDock.SplitLayoutSystem(363, 273, System.Windows.Forms.Orientation.Vertical, new TD.SandDock.LayoutSystemBase[] {
                        ((TD.SandDock.LayoutSystemBase)(new TD.SandDock.ControlLayoutSystem(109, 273, new TD.SandDock.DockControl[] {
                                    this.dockControl1}, this.dockControl1))),
                        ((TD.SandDock.LayoutSystemBase)(new TD.SandDock.SplitLayoutSystem(250, 273, System.Windows.Forms.Orientation.Horizontal, new TD.SandDock.LayoutSystemBase[] {
                                    ((TD.SandDock.LayoutSystemBase)(new TD.SandDock.ControlLayoutSystem(250, 273, new TD.SandDock.DockControl[] {
                                                this.dockControl2}, this.dockControl2)))})))})))});
            this.rightSandDock.Location = new System.Drawing.Point(33, 47);
            this.rightSandDock.Manager = this.sandDockManager1;
            this.rightSandDock.Name = "rightSandDock";
            this.rightSandDock.Size = new System.Drawing.Size(367, 273);
            this.rightSandDock.TabIndex = 5;
            // 
            // bottomSandDock
            // 
            this.bottomSandDock.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.bottomSandDock.Guid = new System.Guid("36c8da63-91d6-4a8d-94c9-8b3dbea928f6");
            this.bottomSandDock.LayoutSystem = new TD.SandDock.SplitLayoutSystem(250, 400);
            this.bottomSandDock.Location = new System.Drawing.Point(0, 320);
            this.bottomSandDock.Manager = this.sandDockManager1;
            this.bottomSandDock.Name = "bottomSandDock";
            this.bottomSandDock.Size = new System.Drawing.Size(400, 0);
            this.bottomSandDock.TabIndex = 6;
            // 
            // topSandDock
            // 
            this.topSandDock.Dock = System.Windows.Forms.DockStyle.Top;
            this.topSandDock.Guid = new System.Guid("9fe452fe-f2f5-44ef-8003-5e91cd949c7e");
            this.topSandDock.LayoutSystem = new TD.SandDock.SplitLayoutSystem(250, 400);
            this.topSandDock.Location = new System.Drawing.Point(0, 47);
            this.topSandDock.Manager = this.sandDockManager1;
            this.topSandDock.Name = "topSandDock";
            this.topSandDock.Size = new System.Drawing.Size(400, 0);
            this.topSandDock.TabIndex = 7;
            // 
            // dockControl1
            // 
            this.dockControl1.Guid = new System.Guid("c98dad4b-1972-4a09-987f-76b6af004845");
            this.dockControl1.Location = new System.Drawing.Point(4, 16);
            this.dockControl1.Name = "dockControl1";
            this.dockControl1.Size = new System.Drawing.Size(109, 233);
            this.dockControl1.TabIndex = 0;
            this.dockControl1.Text = "dockControl1";
            // 
            // dockControl2
            // 
            this.dockControl2.Guid = new System.Guid("410d1158-ea7e-4e44-be6e-f340277b60b4");
            this.dockControl2.Location = new System.Drawing.Point(117, 16);
            this.dockControl2.Name = "dockControl2";
            this.dockControl2.Size = new System.Drawing.Size(250, 233);
            this.dockControl2.TabIndex = 1;
            this.dockControl2.Text = "dockControl2";
            // 
            // test
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(400, 320);
            this.Controls.Add(this.leftSandDock);
            this.Controls.Add(this.rightSandDock);
            this.Controls.Add(this.bottomSandDock);
            this.Controls.Add(this.topSandDock);
            this.Controls.Add(this.leftSandBarDock);
            this.Controls.Add(this.rightSandBarDock);
            this.Controls.Add(this.bottomSandBarDock);
            this.Controls.Add(this.topSandBarDock);
            this.Name = "test";
            this.Text = "test";
            this.Load += new System.EventHandler(this.test_Load);
            this.topSandBarDock.ResumeLayout(false);
            this.rightSandDock.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private TD.SandDock.TabControl tabControl1;
        private TD.SandBar.SandBarManager sandBarManager1;
        private TD.SandBar.ToolBarContainer bottomSandBarDock;
        private TD.SandBar.ToolBarContainer leftSandBarDock;
        private TD.SandDock.DockContainer leftSandDock;
        private TD.SandDock.SandDockManager sandDockManager1;
        private TD.SandDock.DockContainer rightSandDock;
        private TD.SandDock.DockControl dockControl1;
        private TD.SandDock.DockControl dockControl2;
        private TD.SandDock.DockContainer bottomSandDock;
        private TD.SandDock.DockContainer topSandDock;
        private TD.SandBar.ToolBarContainer rightSandBarDock;
        private TD.SandBar.ToolBarContainer topSandBarDock;
        private TD.SandBar.MenuBar menuBar1;
        private TD.SandBar.MenuBarItem menuBarItem1;
        private TD.SandBar.MenuBarItem menuBarItem2;
        private TD.SandBar.MenuBarItem menuBarItem3;
        private TD.SandBar.MenuBarItem menuBarItem4;
        private TD.SandBar.MenuBarItem menuBarItem5;
        private TD.SandBar.ToolBar toolBar1;
    }
}