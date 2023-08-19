-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 3
entity prog_ctr_ram_update_0CLK_3bd6f176 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 write0_value : in unsigned(15 downto 0);
 write0_enable : in unsigned(0 downto 0);
 read1_enable : in unsigned(0 downto 0);
 return_output : out unsigned(15 downto 0));
end prog_ctr_ram_update_0CLK_3bd6f176;
architecture arch of prog_ctr_ram_update_0CLK_3bd6f176 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal wdata : unsigned(7 downto 0) := to_unsigned(0, 8);
signal rdvalue1 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_wdata : unsigned(7 downto 0);
signal REG_COMB_rdvalue1 : unsigned(15 downto 0);

-- Each function instance gets signals
-- prog_ctr_ram[uxn_pc_h_l29_c44_a418]
signal prog_ctr_ram_uxn_pc_h_l29_c44_a418_CLOCK_ENABLE : unsigned(0 downto 0);
signal prog_ctr_ram_uxn_pc_h_l29_c44_a418_addr0 : unsigned(31 downto 0);
signal prog_ctr_ram_uxn_pc_h_l29_c44_a418_wr_data0 : unsigned(15 downto 0);
signal prog_ctr_ram_uxn_pc_h_l29_c44_a418_wr_en0 : unsigned(0 downto 0);
signal prog_ctr_ram_uxn_pc_h_l29_c44_a418_valid0 : unsigned(0 downto 0);
signal prog_ctr_ram_uxn_pc_h_l29_c44_a418_addr1 : unsigned(31 downto 0);
signal prog_ctr_ram_uxn_pc_h_l29_c44_a418_valid1 : unsigned(0 downto 0);
signal prog_ctr_ram_uxn_pc_h_l29_c44_a418_return_output : prog_ctr_ram_outputs_t;

-- BIN_OP_AND[uxn_pc_h_l38_c13_a059]
signal BIN_OP_AND_uxn_pc_h_l38_c13_a059_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_pc_h_l38_c13_a059_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_pc_h_l38_c13_a059_return_output : unsigned(0 downto 0);

-- MUX[uxn_pc_h_l38_c13_8954]
signal MUX_uxn_pc_h_l38_c13_8954_cond : unsigned(0 downto 0);
signal MUX_uxn_pc_h_l38_c13_8954_iftrue : unsigned(15 downto 0);
signal MUX_uxn_pc_h_l38_c13_8954_iffalse : unsigned(15 downto 0);
signal MUX_uxn_pc_h_l38_c13_8954_return_output : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- prog_ctr_ram_uxn_pc_h_l29_c44_a418
prog_ctr_ram_uxn_pc_h_l29_c44_a418 : entity work.prog_ctr_ram_0CLK_b45f1687 port map (
clk,
prog_ctr_ram_uxn_pc_h_l29_c44_a418_CLOCK_ENABLE,
prog_ctr_ram_uxn_pc_h_l29_c44_a418_addr0,
prog_ctr_ram_uxn_pc_h_l29_c44_a418_wr_data0,
prog_ctr_ram_uxn_pc_h_l29_c44_a418_wr_en0,
prog_ctr_ram_uxn_pc_h_l29_c44_a418_valid0,
prog_ctr_ram_uxn_pc_h_l29_c44_a418_addr1,
prog_ctr_ram_uxn_pc_h_l29_c44_a418_valid1,
prog_ctr_ram_uxn_pc_h_l29_c44_a418_return_output);

-- BIN_OP_AND_uxn_pc_h_l38_c13_a059
BIN_OP_AND_uxn_pc_h_l38_c13_a059 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_pc_h_l38_c13_a059_left,
BIN_OP_AND_uxn_pc_h_l38_c13_a059_right,
BIN_OP_AND_uxn_pc_h_l38_c13_a059_return_output);

-- MUX_uxn_pc_h_l38_c13_8954
MUX_uxn_pc_h_l38_c13_8954 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_pc_h_l38_c13_8954_cond,
MUX_uxn_pc_h_l38_c13_8954_iftrue,
MUX_uxn_pc_h_l38_c13_8954_iffalse,
MUX_uxn_pc_h_l38_c13_8954_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 write0_value,
 write0_enable,
 read1_enable,
 -- Registers
 wdata,
 rdvalue1,
 -- All submodule outputs
 prog_ctr_ram_uxn_pc_h_l29_c44_a418_return_output,
 BIN_OP_AND_uxn_pc_h_l38_c13_a059_return_output,
 MUX_uxn_pc_h_l38_c13_8954_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_write0_value : unsigned(15 downto 0);
 variable VAR_write0_enable : unsigned(0 downto 0);
 variable VAR_read1_enable : unsigned(0 downto 0);
 variable VAR_wdata_uxn_pc_h_l24_c2_b612 : unsigned(7 downto 0);
 variable VAR_rw_valid : unsigned(0 downto 0);
 variable VAR_rd_valid : unsigned(0 downto 0);
 variable VAR_prog_ctr_ram_out : prog_ctr_ram_outputs_t;
 variable VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_addr0 : unsigned(31 downto 0);
 variable VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_wr_data0 : unsigned(15 downto 0);
 variable VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_wr_en0 : unsigned(0 downto 0);
 variable VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_valid0 : unsigned(0 downto 0);
 variable VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_addr1 : unsigned(31 downto 0);
 variable VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_valid1 : unsigned(0 downto 0);
 variable VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_return_output : prog_ctr_ram_outputs_t;
 variable VAR_MUX_uxn_pc_h_l38_c13_8954_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_pc_h_l38_c13_8954_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_pc_h_l38_c13_8954_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_prog_ctr_ram_outputs_t_valid1_d41d_uxn_pc_h_l38_c13_9ba4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_pc_h_l38_c13_a059_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_pc_h_l38_c13_a059_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_pc_h_l38_c13_a059_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_prog_ctr_ram_outputs_t_rd_data1_d41d_uxn_pc_h_l38_c54_b1a7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_pc_h_l38_c13_8954_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_wdata : unsigned(7 downto 0);
variable REG_VAR_rdvalue1 : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_wdata := wdata;
  REG_VAR_rdvalue1 := rdvalue1;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_addr0 := resize(to_unsigned(0, 1), 32);
     VAR_MUX_uxn_pc_h_l38_c13_8954_iffalse := resize(to_unsigned(0, 1), 16);
     VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_addr1 := resize(to_unsigned(0, 1), 32);
     VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_valid0 := to_unsigned(1, 1);
     VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_valid1 := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_write0_value := write0_value;
     VAR_write0_enable := write0_enable;
     VAR_read1_enable := read1_enable;

     -- Submodule level 0
     VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_pc_h_l38_c13_a059_right := VAR_read1_enable;
     VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_wr_en0 := VAR_write0_enable;
     VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_wr_data0 := VAR_write0_value;
     VAR_wdata_uxn_pc_h_l24_c2_b612 := resize(VAR_write0_value, 8);
     REG_VAR_wdata := VAR_wdata_uxn_pc_h_l24_c2_b612;
     -- prog_ctr_ram[uxn_pc_h_l29_c44_a418] LATENCY=0
     -- Clock enable
     prog_ctr_ram_uxn_pc_h_l29_c44_a418_CLOCK_ENABLE <= VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_CLOCK_ENABLE;
     -- Inputs
     prog_ctr_ram_uxn_pc_h_l29_c44_a418_addr0 <= VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_addr0;
     prog_ctr_ram_uxn_pc_h_l29_c44_a418_wr_data0 <= VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_wr_data0;
     prog_ctr_ram_uxn_pc_h_l29_c44_a418_wr_en0 <= VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_wr_en0;
     prog_ctr_ram_uxn_pc_h_l29_c44_a418_valid0 <= VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_valid0;
     prog_ctr_ram_uxn_pc_h_l29_c44_a418_addr1 <= VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_addr1;
     prog_ctr_ram_uxn_pc_h_l29_c44_a418_valid1 <= VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_valid1;
     -- Outputs
     VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_return_output := prog_ctr_ram_uxn_pc_h_l29_c44_a418_return_output;

     -- Submodule level 1
     -- CONST_REF_RD_uint1_t_prog_ctr_ram_outputs_t_valid1_d41d[uxn_pc_h_l38_c13_9ba4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_prog_ctr_ram_outputs_t_valid1_d41d_uxn_pc_h_l38_c13_9ba4_return_output := VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_return_output.valid1;

     -- CONST_REF_RD_uint16_t_prog_ctr_ram_outputs_t_rd_data1_d41d[uxn_pc_h_l38_c54_b1a7] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_prog_ctr_ram_outputs_t_rd_data1_d41d_uxn_pc_h_l38_c54_b1a7_return_output := VAR_prog_ctr_ram_uxn_pc_h_l29_c44_a418_return_output.rd_data1;

     -- Submodule level 2
     VAR_MUX_uxn_pc_h_l38_c13_8954_iftrue := VAR_CONST_REF_RD_uint16_t_prog_ctr_ram_outputs_t_rd_data1_d41d_uxn_pc_h_l38_c54_b1a7_return_output;
     VAR_BIN_OP_AND_uxn_pc_h_l38_c13_a059_left := VAR_CONST_REF_RD_uint1_t_prog_ctr_ram_outputs_t_valid1_d41d_uxn_pc_h_l38_c13_9ba4_return_output;
     -- BIN_OP_AND[uxn_pc_h_l38_c13_a059] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_pc_h_l38_c13_a059_left <= VAR_BIN_OP_AND_uxn_pc_h_l38_c13_a059_left;
     BIN_OP_AND_uxn_pc_h_l38_c13_a059_right <= VAR_BIN_OP_AND_uxn_pc_h_l38_c13_a059_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_pc_h_l38_c13_a059_return_output := BIN_OP_AND_uxn_pc_h_l38_c13_a059_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_pc_h_l38_c13_8954_cond := VAR_BIN_OP_AND_uxn_pc_h_l38_c13_a059_return_output;
     -- MUX[uxn_pc_h_l38_c13_8954] LATENCY=0
     -- Inputs
     MUX_uxn_pc_h_l38_c13_8954_cond <= VAR_MUX_uxn_pc_h_l38_c13_8954_cond;
     MUX_uxn_pc_h_l38_c13_8954_iftrue <= VAR_MUX_uxn_pc_h_l38_c13_8954_iftrue;
     MUX_uxn_pc_h_l38_c13_8954_iffalse <= VAR_MUX_uxn_pc_h_l38_c13_8954_iffalse;
     -- Outputs
     VAR_MUX_uxn_pc_h_l38_c13_8954_return_output := MUX_uxn_pc_h_l38_c13_8954_return_output;

     -- Submodule level 4
     REG_VAR_rdvalue1 := VAR_MUX_uxn_pc_h_l38_c13_8954_return_output;
     VAR_return_output := VAR_MUX_uxn_pc_h_l38_c13_8954_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_wdata <= REG_VAR_wdata;
REG_COMB_rdvalue1 <= REG_VAR_rdvalue1;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     wdata <= REG_COMB_wdata;
     rdvalue1 <= REG_COMB_rdvalue1;
 end if;
 end if;
end process;

end arch;
