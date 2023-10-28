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
-- Submodules: 54
entity jcn_0CLK_b288bfb7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_b288bfb7;
architecture arch of jcn_0CLK_b288bfb7 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l690_c6_46c6]
signal BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l690_c1_540c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l690_c2_de10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l690_c2_de10]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l690_c2_de10]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l690_c2_de10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l690_c2_de10]
signal result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l690_c2_de10]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l690_c2_de10]
signal t8_MUX_uxn_opcodes_h_l690_c2_de10_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l690_c2_de10_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l690_c2_de10_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l690_c2_de10_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l690_c2_de10]
signal n8_MUX_uxn_opcodes_h_l690_c2_de10_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l690_c2_de10_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l690_c2_de10_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l690_c2_de10_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l691_c3_27c2[uxn_opcodes_h_l691_c3_27c2]
signal printf_uxn_opcodes_h_l691_c3_27c2_uxn_opcodes_h_l691_c3_27c2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l695_c11_e16b]
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l695_c7_3373]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l695_c7_3373]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l695_c7_3373]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l695_c7_3373]
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l695_c7_3373]
signal result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l695_c7_3373]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l695_c7_3373]
signal t8_MUX_uxn_opcodes_h_l695_c7_3373_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l695_c7_3373_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l695_c7_3373_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l695_c7_3373_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l695_c7_3373]
signal n8_MUX_uxn_opcodes_h_l695_c7_3373_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l695_c7_3373_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l695_c7_3373_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l695_c7_3373_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l698_c11_7f38]
signal BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l698_c7_3915]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l698_c7_3915]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l698_c7_3915]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l698_c7_3915]
signal result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l698_c7_3915]
signal result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l698_c7_3915]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l698_c7_3915]
signal t8_MUX_uxn_opcodes_h_l698_c7_3915_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l698_c7_3915_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l698_c7_3915_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l698_c7_3915_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l698_c7_3915]
signal n8_MUX_uxn_opcodes_h_l698_c7_3915_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l698_c7_3915_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l698_c7_3915_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l698_c7_3915_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l702_c11_b62d]
signal BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l702_c7_9622]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l702_c7_9622]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l702_c7_9622]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l702_c7_9622]
signal result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l702_c7_9622]
signal result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l702_c7_9622]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l702_c7_9622]
signal n8_MUX_uxn_opcodes_h_l702_c7_9622_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l702_c7_9622_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l702_c7_9622_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l702_c7_9622_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l705_c11_3db5]
signal BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l705_c7_2f94]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l705_c7_2f94]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l705_c7_2f94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l705_c7_2f94]
signal result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l705_c7_2f94]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l705_c7_2f94]
signal n8_MUX_uxn_opcodes_h_l705_c7_2f94_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l705_c7_2f94_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l708_c30_b1dc]
signal sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l710_c22_afe2]
signal BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l710_c37_6d6d]
signal BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l710_c22_967d]
signal MUX_uxn_opcodes_h_l710_c22_967d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l710_c22_967d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l710_c22_967d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l710_c22_967d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l712_c11_68a5]
signal BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l712_c7_5538]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l712_c7_5538]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l712_c7_5538]
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8040( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6
BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_left,
BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_right,
BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10
result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10
result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_cond,
result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_return_output);

-- t8_MUX_uxn_opcodes_h_l690_c2_de10
t8_MUX_uxn_opcodes_h_l690_c2_de10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l690_c2_de10_cond,
t8_MUX_uxn_opcodes_h_l690_c2_de10_iftrue,
t8_MUX_uxn_opcodes_h_l690_c2_de10_iffalse,
t8_MUX_uxn_opcodes_h_l690_c2_de10_return_output);

-- n8_MUX_uxn_opcodes_h_l690_c2_de10
n8_MUX_uxn_opcodes_h_l690_c2_de10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l690_c2_de10_cond,
n8_MUX_uxn_opcodes_h_l690_c2_de10_iftrue,
n8_MUX_uxn_opcodes_h_l690_c2_de10_iffalse,
n8_MUX_uxn_opcodes_h_l690_c2_de10_return_output);

-- printf_uxn_opcodes_h_l691_c3_27c2_uxn_opcodes_h_l691_c3_27c2
printf_uxn_opcodes_h_l691_c3_27c2_uxn_opcodes_h_l691_c3_27c2 : entity work.printf_uxn_opcodes_h_l691_c3_27c2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l691_c3_27c2_uxn_opcodes_h_l691_c3_27c2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b
BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_left,
BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_right,
BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373
result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373
result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_cond,
result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373
result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_return_output);

-- t8_MUX_uxn_opcodes_h_l695_c7_3373
t8_MUX_uxn_opcodes_h_l695_c7_3373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l695_c7_3373_cond,
t8_MUX_uxn_opcodes_h_l695_c7_3373_iftrue,
t8_MUX_uxn_opcodes_h_l695_c7_3373_iffalse,
t8_MUX_uxn_opcodes_h_l695_c7_3373_return_output);

-- n8_MUX_uxn_opcodes_h_l695_c7_3373
n8_MUX_uxn_opcodes_h_l695_c7_3373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l695_c7_3373_cond,
n8_MUX_uxn_opcodes_h_l695_c7_3373_iftrue,
n8_MUX_uxn_opcodes_h_l695_c7_3373_iffalse,
n8_MUX_uxn_opcodes_h_l695_c7_3373_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38
BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_left,
BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_right,
BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915
result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915
result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915
result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915
result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_cond,
result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915
result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_return_output);

-- t8_MUX_uxn_opcodes_h_l698_c7_3915
t8_MUX_uxn_opcodes_h_l698_c7_3915 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l698_c7_3915_cond,
t8_MUX_uxn_opcodes_h_l698_c7_3915_iftrue,
t8_MUX_uxn_opcodes_h_l698_c7_3915_iffalse,
t8_MUX_uxn_opcodes_h_l698_c7_3915_return_output);

-- n8_MUX_uxn_opcodes_h_l698_c7_3915
n8_MUX_uxn_opcodes_h_l698_c7_3915 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l698_c7_3915_cond,
n8_MUX_uxn_opcodes_h_l698_c7_3915_iftrue,
n8_MUX_uxn_opcodes_h_l698_c7_3915_iffalse,
n8_MUX_uxn_opcodes_h_l698_c7_3915_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d
BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_left,
BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_right,
BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622
result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622
result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622
result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622
result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_cond,
result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622
result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_return_output);

-- n8_MUX_uxn_opcodes_h_l702_c7_9622
n8_MUX_uxn_opcodes_h_l702_c7_9622 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l702_c7_9622_cond,
n8_MUX_uxn_opcodes_h_l702_c7_9622_iftrue,
n8_MUX_uxn_opcodes_h_l702_c7_9622_iffalse,
n8_MUX_uxn_opcodes_h_l702_c7_9622_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5
BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_left,
BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_right,
BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94
result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94
result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94
result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94
result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_cond,
result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94
result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_return_output);

-- n8_MUX_uxn_opcodes_h_l705_c7_2f94
n8_MUX_uxn_opcodes_h_l705_c7_2f94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l705_c7_2f94_cond,
n8_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue,
n8_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse,
n8_MUX_uxn_opcodes_h_l705_c7_2f94_return_output);

-- sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc
sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_ins,
sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_x,
sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_y,
sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2
BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_left,
BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_right,
BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d
BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_left,
BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_right,
BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_return_output);

-- MUX_uxn_opcodes_h_l710_c22_967d
MUX_uxn_opcodes_h_l710_c22_967d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l710_c22_967d_cond,
MUX_uxn_opcodes_h_l710_c22_967d_iftrue,
MUX_uxn_opcodes_h_l710_c22_967d_iffalse,
MUX_uxn_opcodes_h_l710_c22_967d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5
BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_left,
BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_right,
BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538
result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_return_output,
 t8_MUX_uxn_opcodes_h_l690_c2_de10_return_output,
 n8_MUX_uxn_opcodes_h_l690_c2_de10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_return_output,
 t8_MUX_uxn_opcodes_h_l695_c7_3373_return_output,
 n8_MUX_uxn_opcodes_h_l695_c7_3373_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_return_output,
 t8_MUX_uxn_opcodes_h_l698_c7_3915_return_output,
 n8_MUX_uxn_opcodes_h_l698_c7_3915_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_return_output,
 n8_MUX_uxn_opcodes_h_l702_c7_9622_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_return_output,
 n8_MUX_uxn_opcodes_h_l705_c7_2f94_return_output,
 sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_return_output,
 MUX_uxn_opcodes_h_l710_c22_967d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l692_c3_5553 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l690_c2_de10_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l690_c2_de10_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l695_c7_3373_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l690_c2_de10_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l690_c2_de10_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l690_c2_de10_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l690_c2_de10_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l695_c7_3373_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l690_c2_de10_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l690_c2_de10_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l691_c3_27c2_uxn_opcodes_h_l691_c3_27c2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l696_c3_be0e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l695_c7_3373_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l695_c7_3373_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l698_c7_3915_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l695_c7_3373_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l695_c7_3373_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l695_c7_3373_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l698_c7_3915_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l695_c7_3373_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l700_c3_6ba6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l698_c7_3915_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l698_c7_3915_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l698_c7_3915_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l698_c7_3915_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l698_c7_3915_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l702_c7_9622_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l698_c7_3915_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_442d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l702_c7_9622_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l702_c7_9622_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l702_c7_9622_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l705_c7_2f94_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l702_c7_9622_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l705_c7_2f94_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l710_c22_967d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l710_c22_967d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l710_c22_967d_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l710_c42_844c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l710_c22_967d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l712_l695_l690_l702_l698_DUPLICATE_dce3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l712_l695_l690_l702_l698_DUPLICATE_b7a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l695_l690_l702_l705_l698_DUPLICATE_8ed0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l695_l690_l702_l705_l698_DUPLICATE_60a4_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l712_l695_l702_l705_l698_DUPLICATE_3d78_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8040_uxn_opcodes_h_l718_l686_DUPLICATE_953f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_442d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_442d;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l692_c3_5553 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l692_c3_5553;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l696_c3_be0e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l696_c3_be0e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l700_c3_6ba6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l700_c3_6ba6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l690_c2_de10_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l695_c7_3373_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l698_c7_3915_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l702_c7_9622_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l710_c22_967d_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l698_c7_3915_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l690_c2_de10_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l695_c7_3373_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l698_c7_3915_iffalse := t8;
     -- CAST_TO_int8_t[uxn_opcodes_h_l710_c42_844c] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l710_c42_844c_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l710_c22_afe2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_left;
     BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_return_output := BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l712_c11_68a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l702_c11_b62d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_left;
     BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_return_output := BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l695_l690_l702_l705_l698_DUPLICATE_60a4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l695_l690_l702_l705_l698_DUPLICATE_60a4_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l690_c6_46c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l695_l690_l702_l705_l698_DUPLICATE_8ed0 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l695_l690_l702_l705_l698_DUPLICATE_8ed0_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l705_c11_3db5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_left;
     BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_return_output := BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l698_c11_7f38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_left;
     BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_return_output := BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l712_l695_l690_l702_l698_DUPLICATE_dce3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l712_l695_l690_l702_l698_DUPLICATE_dce3_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l695_c11_e16b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_left;
     BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_return_output := BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l708_c30_b1dc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_ins;
     sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_x;
     sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_return_output := sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l712_l695_l690_l702_l698_DUPLICATE_b7a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l712_l695_l690_l702_l698_DUPLICATE_b7a8_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l702_c7_9622] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l702_c7_9622_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l712_l695_l702_l705_l698_DUPLICATE_3d78 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l712_l695_l702_l705_l698_DUPLICATE_3d78_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l690_c2_de10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l690_c2_de10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c6_46c6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l695_c7_3373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l695_c7_3373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_e16b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l698_c7_3915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l698_c7_3915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_7f38_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l702_c7_9622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c11_b62d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l705_c7_2f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_3db5_return_output;
     VAR_MUX_uxn_opcodes_h_l710_c22_967d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c22_afe2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c11_68a5_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l710_c42_844c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l695_l690_l702_l705_l698_DUPLICATE_60a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l695_l690_l702_l705_l698_DUPLICATE_60a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l695_l690_l702_l705_l698_DUPLICATE_60a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l695_l690_l702_l705_l698_DUPLICATE_60a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l695_l690_l702_l705_l698_DUPLICATE_60a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l695_l690_l702_l705_l698_DUPLICATE_8ed0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l695_l690_l702_l705_l698_DUPLICATE_8ed0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l695_l690_l702_l705_l698_DUPLICATE_8ed0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l695_l690_l702_l705_l698_DUPLICATE_8ed0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l695_l690_l702_l705_l698_DUPLICATE_8ed0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l712_l695_l702_l705_l698_DUPLICATE_3d78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l712_l695_l702_l705_l698_DUPLICATE_3d78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l712_l695_l702_l705_l698_DUPLICATE_3d78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l712_l695_l702_l705_l698_DUPLICATE_3d78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l712_l695_l702_l705_l698_DUPLICATE_3d78_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l712_l695_l690_l702_l698_DUPLICATE_dce3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l712_l695_l690_l702_l698_DUPLICATE_dce3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l712_l695_l690_l702_l698_DUPLICATE_dce3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l712_l695_l690_l702_l698_DUPLICATE_dce3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l712_l695_l690_l702_l698_DUPLICATE_dce3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l712_l695_l690_l702_l698_DUPLICATE_b7a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l712_l695_l690_l702_l698_DUPLICATE_b7a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l712_l695_l690_l702_l698_DUPLICATE_b7a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l712_l695_l690_l702_l698_DUPLICATE_b7a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l712_l695_l690_l702_l698_DUPLICATE_b7a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l702_c7_9622_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l708_c30_b1dc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l702_c7_9622] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l712_c7_5538] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_return_output;

     -- n8_MUX[uxn_opcodes_h_l705_c7_2f94] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l705_c7_2f94_cond <= VAR_n8_MUX_uxn_opcodes_h_l705_c7_2f94_cond;
     n8_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue;
     n8_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l705_c7_2f94_return_output := n8_MUX_uxn_opcodes_h_l705_c7_2f94_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l712_c7_5538] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l710_c37_6d6d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l690_c1_540c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l712_c7_5538] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_return_output;

     -- t8_MUX[uxn_opcodes_h_l698_c7_3915] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l698_c7_3915_cond <= VAR_t8_MUX_uxn_opcodes_h_l698_c7_3915_cond;
     t8_MUX_uxn_opcodes_h_l698_c7_3915_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l698_c7_3915_iftrue;
     t8_MUX_uxn_opcodes_h_l698_c7_3915_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l698_c7_3915_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l698_c7_3915_return_output := t8_MUX_uxn_opcodes_h_l698_c7_3915_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l705_c7_2f94] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l710_c22_967d_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l710_c37_6d6d_return_output)),16);
     VAR_printf_uxn_opcodes_h_l691_c3_27c2_uxn_opcodes_h_l691_c3_27c2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l690_c1_540c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l702_c7_9622_iffalse := VAR_n8_MUX_uxn_opcodes_h_l705_c7_2f94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c7_5538_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c7_5538_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c7_5538_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_2f94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c7_9622_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l695_c7_3373_iffalse := VAR_t8_MUX_uxn_opcodes_h_l698_c7_3915_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l705_c7_2f94] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l702_c7_9622] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l705_c7_2f94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l698_c7_3915] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_return_output;

     -- t8_MUX[uxn_opcodes_h_l695_c7_3373] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l695_c7_3373_cond <= VAR_t8_MUX_uxn_opcodes_h_l695_c7_3373_cond;
     t8_MUX_uxn_opcodes_h_l695_c7_3373_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l695_c7_3373_iftrue;
     t8_MUX_uxn_opcodes_h_l695_c7_3373_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l695_c7_3373_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l695_c7_3373_return_output := t8_MUX_uxn_opcodes_h_l695_c7_3373_return_output;

     -- printf_uxn_opcodes_h_l691_c3_27c2[uxn_opcodes_h_l691_c3_27c2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l691_c3_27c2_uxn_opcodes_h_l691_c3_27c2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l691_c3_27c2_uxn_opcodes_h_l691_c3_27c2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l702_c7_9622] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l702_c7_9622_cond <= VAR_n8_MUX_uxn_opcodes_h_l702_c7_9622_cond;
     n8_MUX_uxn_opcodes_h_l702_c7_9622_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l702_c7_9622_iftrue;
     n8_MUX_uxn_opcodes_h_l702_c7_9622_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l702_c7_9622_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l702_c7_9622_return_output := n8_MUX_uxn_opcodes_h_l702_c7_9622_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l705_c7_2f94] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_return_output;

     -- MUX[uxn_opcodes_h_l710_c22_967d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l710_c22_967d_cond <= VAR_MUX_uxn_opcodes_h_l710_c22_967d_cond;
     MUX_uxn_opcodes_h_l710_c22_967d_iftrue <= VAR_MUX_uxn_opcodes_h_l710_c22_967d_iftrue;
     MUX_uxn_opcodes_h_l710_c22_967d_iffalse <= VAR_MUX_uxn_opcodes_h_l710_c22_967d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l710_c22_967d_return_output := MUX_uxn_opcodes_h_l710_c22_967d_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue := VAR_MUX_uxn_opcodes_h_l710_c22_967d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l698_c7_3915_iffalse := VAR_n8_MUX_uxn_opcodes_h_l702_c7_9622_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_2f94_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l705_c7_2f94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_2f94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c7_9622_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_3915_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l690_c2_de10_iffalse := VAR_t8_MUX_uxn_opcodes_h_l695_c7_3373_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l702_c7_9622] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l702_c7_9622] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_return_output;

     -- t8_MUX[uxn_opcodes_h_l690_c2_de10] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l690_c2_de10_cond <= VAR_t8_MUX_uxn_opcodes_h_l690_c2_de10_cond;
     t8_MUX_uxn_opcodes_h_l690_c2_de10_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l690_c2_de10_iftrue;
     t8_MUX_uxn_opcodes_h_l690_c2_de10_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l690_c2_de10_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l690_c2_de10_return_output := t8_MUX_uxn_opcodes_h_l690_c2_de10_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l698_c7_3915] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l695_c7_3373] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_return_output;

     -- n8_MUX[uxn_opcodes_h_l698_c7_3915] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l698_c7_3915_cond <= VAR_n8_MUX_uxn_opcodes_h_l698_c7_3915_cond;
     n8_MUX_uxn_opcodes_h_l698_c7_3915_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l698_c7_3915_iftrue;
     n8_MUX_uxn_opcodes_h_l698_c7_3915_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l698_c7_3915_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l698_c7_3915_return_output := n8_MUX_uxn_opcodes_h_l698_c7_3915_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l705_c7_2f94] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_cond;
     result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_return_output := result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l702_c7_9622] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l695_c7_3373_iffalse := VAR_n8_MUX_uxn_opcodes_h_l698_c7_3915_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c7_9622_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c7_9622_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c7_9622_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_3915_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_3373_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l705_c7_2f94_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l690_c2_de10_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l698_c7_3915] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l698_c7_3915] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l695_c7_3373] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l698_c7_3915] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l702_c7_9622] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_cond;
     result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_return_output := result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_return_output;

     -- n8_MUX[uxn_opcodes_h_l695_c7_3373] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l695_c7_3373_cond <= VAR_n8_MUX_uxn_opcodes_h_l695_c7_3373_cond;
     n8_MUX_uxn_opcodes_h_l695_c7_3373_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l695_c7_3373_iftrue;
     n8_MUX_uxn_opcodes_h_l695_c7_3373_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l695_c7_3373_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l695_c7_3373_return_output := n8_MUX_uxn_opcodes_h_l695_c7_3373_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l690_c2_de10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l690_c2_de10_iffalse := VAR_n8_MUX_uxn_opcodes_h_l695_c7_3373_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_3915_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_3915_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_3915_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_3373_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l702_c7_9622_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l690_c2_de10] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l698_c7_3915] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_cond;
     result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_return_output := result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l695_c7_3373] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_return_output;

     -- n8_MUX[uxn_opcodes_h_l690_c2_de10] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l690_c2_de10_cond <= VAR_n8_MUX_uxn_opcodes_h_l690_c2_de10_cond;
     n8_MUX_uxn_opcodes_h_l690_c2_de10_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l690_c2_de10_iftrue;
     n8_MUX_uxn_opcodes_h_l690_c2_de10_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l690_c2_de10_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l690_c2_de10_return_output := n8_MUX_uxn_opcodes_h_l690_c2_de10_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l695_c7_3373] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l695_c7_3373] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l690_c2_de10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_3373_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_3373_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_3373_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l698_c7_3915_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l690_c2_de10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l695_c7_3373] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_cond;
     result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_return_output := result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l690_c2_de10] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l690_c2_de10] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l695_c7_3373_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l690_c2_de10] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_cond;
     result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_return_output := result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8040_uxn_opcodes_h_l718_l686_DUPLICATE_953f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8040_uxn_opcodes_h_l718_l686_DUPLICATE_953f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8040(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c2_de10_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c2_de10_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c2_de10_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c2_de10_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l690_c2_de10_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c2_de10_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8040_uxn_opcodes_h_l718_l686_DUPLICATE_953f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8040_uxn_opcodes_h_l718_l686_DUPLICATE_953f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
