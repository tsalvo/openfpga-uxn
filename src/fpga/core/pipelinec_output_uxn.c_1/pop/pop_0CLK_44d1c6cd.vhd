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
-- Submodules: 5
entity pop_0CLK_44d1c6cd is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end pop_0CLK_44d1c6cd;
architecture arch of pop_0CLK_44d1c6cd is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l258_c6_a710]
signal BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l258_c2_9177]
signal result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l258_c2_9177]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l263_c30_0bf6]
signal sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_return_output : signed(3 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e0a8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710
BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_left,
BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_right,
BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177
result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177
result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_return_output);

-- sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6
sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_ins,
sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_x,
sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_y,
sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 -- Registers
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_return_output,
 sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l267_c3_f697 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e0a8_uxn_opcodes_h_l255_l271_DUPLICATE_27ef_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l267_c3_f697 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l267_c3_f697;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_y := resize(to_signed(-1, 2), 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_left := VAR_phase;
     -- BIN_OP_EQ[uxn_opcodes_h_l258_c6_a710] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_left;
     BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_return_output := BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l263_c30_0bf6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_ins;
     sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_x;
     sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_return_output := sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c6_a710_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l263_c30_0bf6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l258_c2_9177] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l258_c2_9177] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_return_output;

     -- Submodule level 2
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e0a8_uxn_opcodes_h_l255_l271_DUPLICATE_27ef LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e0a8_uxn_opcodes_h_l255_l271_DUPLICATE_27ef_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e0a8(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c2_9177_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l258_c2_9177_return_output);

     -- Submodule level 3
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e0a8_uxn_opcodes_h_l255_l271_DUPLICATE_27ef_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e0a8_uxn_opcodes_h_l255_l271_DUPLICATE_27ef_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
