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
-- Submodules: 72
entity jci_0CLK_cf70ec0f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_cf70ec0f;
architecture arch of jci_0CLK_cf70ec0f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l68_c6_debe]
signal BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l68_c1_cada]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l68_c2_d460]
signal result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l68_c2_d460]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l68_c2_d460]
signal result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l68_c2_d460]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l68_c2_d460]
signal result_pc_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l68_c2_d460]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l68_c2_d460]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l68_c2_d460]
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l68_c2_d460]
signal t8_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l68_c2_d460]
signal tmp16_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l69_c3_e276[uxn_opcodes_h_l69_c3_e276]
signal printf_uxn_opcodes_h_l69_c3_e276_uxn_opcodes_h_l69_c3_e276_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l74_c11_2481]
signal BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l74_c7_2156]
signal result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l74_c7_2156]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l74_c7_2156]
signal result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l74_c7_2156]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l74_c7_2156]
signal result_pc_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l74_c7_2156]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l74_c7_2156]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l74_c7_2156]
signal result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l74_c7_2156]
signal t8_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l74_c7_2156]
signal tmp16_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l77_c11_9fd5]
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l77_c7_546f]
signal result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l77_c7_546f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l77_c7_546f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l77_c7_546f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l77_c7_546f]
signal result_pc_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l77_c7_546f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l77_c7_546f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l77_c7_546f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l77_c7_546f]
signal t8_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_546f_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l77_c7_546f]
signal tmp16_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_546f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l84_c11_1782]
signal BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l84_c7_8c19]
signal result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l84_c7_8c19]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l84_c7_8c19]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l84_c7_8c19]
signal result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l84_c7_8c19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l84_c7_8c19]
signal tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l88_c11_4de1]
signal BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l88_c7_8d4e]
signal result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l88_c7_8d4e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l88_c7_8d4e]
signal result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l88_c7_8d4e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l88_c7_8d4e]
signal tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l90_c3_9cb3]
signal CONST_SL_8_uxn_opcodes_h_l90_c3_9cb3_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l90_c3_9cb3_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l91_c21_86cb]
signal BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l93_c11_e11e]
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l93_c7_40ab]
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l93_c7_40ab]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l93_c7_40ab]
signal result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l93_c7_40ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l93_c7_40ab]
signal tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l94_c21_0451]
signal BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_6462]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_ea86]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l96_c7_ea86]
signal result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_ea86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l96_c7_ea86]
signal tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l97_c3_6277]
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c15_3515]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c25_8f59]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c35_f2b8]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c35_0839]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l99_c15_3e01]
signal MUX_uxn_opcodes_h_l99_c15_3e01_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l99_c15_3e01_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c15_3e01_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c15_3e01_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l101_c11_e27c]
signal BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l101_c7_2087]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l101_c7_2087]
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_09ef( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.ram_addr := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.pc := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe
BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_left,
BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_right,
BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460
result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460
result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_cond,
result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_return_output);

-- result_pc_MUX_uxn_opcodes_h_l68_c2_d460
result_pc_MUX_uxn_opcodes_h_l68_c2_d460 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l68_c2_d460_cond,
result_pc_MUX_uxn_opcodes_h_l68_c2_d460_iftrue,
result_pc_MUX_uxn_opcodes_h_l68_c2_d460_iffalse,
result_pc_MUX_uxn_opcodes_h_l68_c2_d460_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_return_output);

-- t8_MUX_uxn_opcodes_h_l68_c2_d460
t8_MUX_uxn_opcodes_h_l68_c2_d460 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l68_c2_d460_cond,
t8_MUX_uxn_opcodes_h_l68_c2_d460_iftrue,
t8_MUX_uxn_opcodes_h_l68_c2_d460_iffalse,
t8_MUX_uxn_opcodes_h_l68_c2_d460_return_output);

-- tmp16_MUX_uxn_opcodes_h_l68_c2_d460
tmp16_MUX_uxn_opcodes_h_l68_c2_d460 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l68_c2_d460_cond,
tmp16_MUX_uxn_opcodes_h_l68_c2_d460_iftrue,
tmp16_MUX_uxn_opcodes_h_l68_c2_d460_iffalse,
tmp16_MUX_uxn_opcodes_h_l68_c2_d460_return_output);

-- printf_uxn_opcodes_h_l69_c3_e276_uxn_opcodes_h_l69_c3_e276
printf_uxn_opcodes_h_l69_c3_e276_uxn_opcodes_h_l69_c3_e276 : entity work.printf_uxn_opcodes_h_l69_c3_e276_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l69_c3_e276_uxn_opcodes_h_l69_c3_e276_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481
BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_left,
BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_right,
BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156
result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156
result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156
result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_cond,
result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156
result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_return_output);

-- result_pc_MUX_uxn_opcodes_h_l74_c7_2156
result_pc_MUX_uxn_opcodes_h_l74_c7_2156 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l74_c7_2156_cond,
result_pc_MUX_uxn_opcodes_h_l74_c7_2156_iftrue,
result_pc_MUX_uxn_opcodes_h_l74_c7_2156_iffalse,
result_pc_MUX_uxn_opcodes_h_l74_c7_2156_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156
result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156
result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_return_output);

-- t8_MUX_uxn_opcodes_h_l74_c7_2156
t8_MUX_uxn_opcodes_h_l74_c7_2156 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l74_c7_2156_cond,
t8_MUX_uxn_opcodes_h_l74_c7_2156_iftrue,
t8_MUX_uxn_opcodes_h_l74_c7_2156_iffalse,
t8_MUX_uxn_opcodes_h_l74_c7_2156_return_output);

-- tmp16_MUX_uxn_opcodes_h_l74_c7_2156
tmp16_MUX_uxn_opcodes_h_l74_c7_2156 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l74_c7_2156_cond,
tmp16_MUX_uxn_opcodes_h_l74_c7_2156_iftrue,
tmp16_MUX_uxn_opcodes_h_l74_c7_2156_iffalse,
tmp16_MUX_uxn_opcodes_h_l74_c7_2156_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5
BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_left,
BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_right,
BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f
result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f
result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l77_c7_546f
result_pc_MUX_uxn_opcodes_h_l77_c7_546f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l77_c7_546f_cond,
result_pc_MUX_uxn_opcodes_h_l77_c7_546f_iftrue,
result_pc_MUX_uxn_opcodes_h_l77_c7_546f_iffalse,
result_pc_MUX_uxn_opcodes_h_l77_c7_546f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_return_output);

-- t8_MUX_uxn_opcodes_h_l77_c7_546f
t8_MUX_uxn_opcodes_h_l77_c7_546f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l77_c7_546f_cond,
t8_MUX_uxn_opcodes_h_l77_c7_546f_iftrue,
t8_MUX_uxn_opcodes_h_l77_c7_546f_iffalse,
t8_MUX_uxn_opcodes_h_l77_c7_546f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l77_c7_546f
tmp16_MUX_uxn_opcodes_h_l77_c7_546f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l77_c7_546f_cond,
tmp16_MUX_uxn_opcodes_h_l77_c7_546f_iftrue,
tmp16_MUX_uxn_opcodes_h_l77_c7_546f_iffalse,
tmp16_MUX_uxn_opcodes_h_l77_c7_546f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782
BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_left,
BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_right,
BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19
result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_cond,
result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19
result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_return_output);

-- result_pc_MUX_uxn_opcodes_h_l84_c7_8c19
result_pc_MUX_uxn_opcodes_h_l84_c7_8c19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_cond,
result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue,
result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse,
result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_return_output);

-- tmp16_MUX_uxn_opcodes_h_l84_c7_8c19
tmp16_MUX_uxn_opcodes_h_l84_c7_8c19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_cond,
tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue,
tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse,
tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1
BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_left,
BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_right,
BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e
result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e
result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e
result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_cond,
result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue,
result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse,
result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e
result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e
tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_cond,
tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue,
tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse,
tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l90_c3_9cb3
CONST_SL_8_uxn_opcodes_h_l90_c3_9cb3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l90_c3_9cb3_x,
CONST_SL_8_uxn_opcodes_h_l90_c3_9cb3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb
BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_left,
BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_right,
BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e
BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_left,
BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_right,
BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_cond,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_return_output);

-- result_pc_MUX_uxn_opcodes_h_l93_c7_40ab
result_pc_MUX_uxn_opcodes_h_l93_c7_40ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_cond,
result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue,
result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse,
result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l93_c7_40ab
tmp16_MUX_uxn_opcodes_h_l93_c7_40ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_cond,
tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue,
tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse,
tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451
BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_left,
BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_right,
BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462
BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_return_output);

-- result_pc_MUX_uxn_opcodes_h_l96_c7_ea86
result_pc_MUX_uxn_opcodes_h_l96_c7_ea86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_cond,
result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue,
result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse,
result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_return_output);

-- tmp16_MUX_uxn_opcodes_h_l96_c7_ea86
tmp16_MUX_uxn_opcodes_h_l96_c7_ea86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_cond,
tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue,
tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse,
tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l97_c3_6277
BIN_OP_OR_uxn_opcodes_h_l97_c3_6277 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_left,
BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_right,
BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515
BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59
BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8
BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839
BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_return_output);

-- MUX_uxn_opcodes_h_l99_c15_3e01
MUX_uxn_opcodes_h_l99_c15_3e01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l99_c15_3e01_cond,
MUX_uxn_opcodes_h_l99_c15_3e01_iftrue,
MUX_uxn_opcodes_h_l99_c15_3e01_iffalse,
MUX_uxn_opcodes_h_l99_c15_3e01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c
BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_left,
BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_right,
BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
 result_pc_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
 t8_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
 tmp16_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_return_output,
 result_pc_MUX_uxn_opcodes_h_l74_c7_2156_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_return_output,
 t8_MUX_uxn_opcodes_h_l74_c7_2156_return_output,
 tmp16_MUX_uxn_opcodes_h_l74_c7_2156_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_return_output,
 result_pc_MUX_uxn_opcodes_h_l77_c7_546f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_return_output,
 t8_MUX_uxn_opcodes_h_l77_c7_546f_return_output,
 tmp16_MUX_uxn_opcodes_h_l77_c7_546f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_return_output,
 result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_return_output,
 tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output,
 result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output,
 tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output,
 CONST_SL_8_uxn_opcodes_h_l90_c3_9cb3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_return_output,
 result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_return_output,
 tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_return_output,
 result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_return_output,
 tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_return_output,
 BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_return_output,
 MUX_uxn_opcodes_h_l99_c15_3e01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l71_c3_9306 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_d460_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_d460_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_d460_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_d460_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l69_c3_e276_uxn_opcodes_h_l69_c3_e276_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l77_c7_546f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l75_c3_c214 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l74_c7_2156_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_546f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_2156_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_2156_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_546f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_2156_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l81_c3_2456 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_546f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_546f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_546f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l91_c3_4172 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l90_c3_9cb3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l90_c3_9cb3_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l94_c3_3bd4 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c15_3e01_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c15_3e01_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c15_3e01_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c15_3e01_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l101_l77_l93_l74_l88_l68_l84_DUPLICATE_658b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l68_l93_l74_DUPLICATE_a694_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l84_l74_DUPLICATE_a64e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l96_l77_l93_l74_l88_l68_l84_DUPLICATE_7d3b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l77_l68_l74_DUPLICATE_b468_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l77_l74_DUPLICATE_14ee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l101_l96_l77_l93_l74_l88_l84_DUPLICATE_db79_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l89_l97_DUPLICATE_0334_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09ef_uxn_opcodes_h_l106_l63_DUPLICATE_e54c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l75_c3_c214 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l75_c3_c214;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l81_c3_2456 := resize(to_signed(-1, 2), 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l81_c3_2456;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l71_c3_9306 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l71_c3_9306;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_546f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_d460_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l74_c7_2156_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_546f_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_d460_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_2156_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_546f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_6462] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l84_l74_DUPLICATE_a64e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l84_l74_DUPLICATE_a64e_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l77_l74_DUPLICATE_14ee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l77_l74_DUPLICATE_14ee_return_output := result.is_stack_read;

     -- BIN_OP_PLUS[uxn_opcodes_h_l91_c21_86cb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l94_c21_0451] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_left;
     BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_return_output := BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l68_l93_l74_DUPLICATE_a694 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l68_l93_l74_DUPLICATE_a694_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l93_c11_e11e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_left;
     BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_return_output := BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l68_c6_debe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_left;
     BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output := BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l77_l68_l74_DUPLICATE_b468 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l77_l68_l74_DUPLICATE_b468_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l84_c11_1782] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_left;
     BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_return_output := BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l101_c11_e27c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_left;
     BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_return_output := BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c25_8f59] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l74_c11_2481] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_left;
     BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_return_output := BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l96_l77_l93_l74_l88_l68_l84_DUPLICATE_7d3b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l96_l77_l93_l74_l88_l68_l84_DUPLICATE_7d3b_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l101_l96_l77_l93_l74_l88_l84_DUPLICATE_db79 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l101_l96_l77_l93_l74_l88_l84_DUPLICATE_db79_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l77_c11_9fd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_left;
     BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_return_output := BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l101_l77_l93_l74_l88_l68_l84_DUPLICATE_658b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l101_l77_l93_l74_l88_l68_l84_DUPLICATE_658b_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c15_3515] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l88_c11_4de1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_left;
     BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_return_output := BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l89_l97_DUPLICATE_0334 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l89_l97_DUPLICATE_0334_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l74_c7_2156] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l74_c7_2156_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_e27c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_d460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_d460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_d460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_debe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l74_c7_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_2481_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l77_c7_546f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_546f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_546f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_9fd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_1782_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_4de1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_e11e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6462_return_output;
     VAR_MUX_uxn_opcodes_h_l99_c15_3e01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c15_3515_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l91_c3_4172 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l91_c21_86cb_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l94_c3_3bd4 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c21_0451_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l99_c15_3e01_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c25_8f59_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l89_l97_DUPLICATE_0334_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l90_c3_9cb3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l89_l97_DUPLICATE_0334_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l77_l68_l74_DUPLICATE_b468_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l77_l68_l74_DUPLICATE_b468_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l77_l68_l74_DUPLICATE_b468_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_d460_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l96_l77_l93_l74_l88_l68_l84_DUPLICATE_7d3b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_2156_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l96_l77_l93_l74_l88_l68_l84_DUPLICATE_7d3b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l77_c7_546f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l96_l77_l93_l74_l88_l68_l84_DUPLICATE_7d3b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l96_l77_l93_l74_l88_l68_l84_DUPLICATE_7d3b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l96_l77_l93_l74_l88_l68_l84_DUPLICATE_7d3b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l96_l77_l93_l74_l88_l68_l84_DUPLICATE_7d3b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l96_l77_l93_l74_l88_l68_l84_DUPLICATE_7d3b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l68_l93_l74_DUPLICATE_a694_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l68_l93_l74_DUPLICATE_a694_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l68_l93_l74_DUPLICATE_a694_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l101_l96_l77_l93_l74_l88_l84_DUPLICATE_db79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l101_l96_l77_l93_l74_l88_l84_DUPLICATE_db79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l101_l96_l77_l93_l74_l88_l84_DUPLICATE_db79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l101_l96_l77_l93_l74_l88_l84_DUPLICATE_db79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l101_l96_l77_l93_l74_l88_l84_DUPLICATE_db79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l101_l96_l77_l93_l74_l88_l84_DUPLICATE_db79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l101_l96_l77_l93_l74_l88_l84_DUPLICATE_db79_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l101_l77_l93_l74_l88_l68_l84_DUPLICATE_658b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l101_l77_l93_l74_l88_l68_l84_DUPLICATE_658b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l101_l77_l93_l74_l88_l68_l84_DUPLICATE_658b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l101_l77_l93_l74_l88_l68_l84_DUPLICATE_658b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l101_l77_l93_l74_l88_l68_l84_DUPLICATE_658b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l101_l77_l93_l74_l88_l68_l84_DUPLICATE_658b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l101_l77_l93_l74_l88_l68_l84_DUPLICATE_658b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l84_l74_DUPLICATE_a64e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l84_l74_DUPLICATE_a64e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l84_l74_DUPLICATE_a64e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l77_l74_DUPLICATE_14ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l77_l74_DUPLICATE_14ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l74_c7_2156_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l91_c3_4172;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l94_c3_3bd4;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l84_c7_8c19] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l93_c7_40ab] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_return_output := result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l77_c7_546f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l101_c7_2087] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l90_c3_9cb3] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l90_c3_9cb3_x <= VAR_CONST_SL_8_uxn_opcodes_h_l90_c3_9cb3_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l90_c3_9cb3_return_output := CONST_SL_8_uxn_opcodes_h_l90_c3_9cb3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l77_c7_546f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l97_c3_6277] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_left;
     BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_return_output := BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_return_output;

     -- t8_MUX[uxn_opcodes_h_l77_c7_546f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l77_c7_546f_cond <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_546f_cond;
     t8_MUX_uxn_opcodes_h_l77_c7_546f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_546f_iftrue;
     t8_MUX_uxn_opcodes_h_l77_c7_546f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_546f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_546f_return_output := t8_MUX_uxn_opcodes_h_l77_c7_546f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l68_c1_cada] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l74_c7_2156] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l101_c7_2087] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_right := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_6277_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l90_c3_9cb3_return_output;
     VAR_printf_uxn_opcodes_h_l69_c3_e276_uxn_opcodes_h_l69_c3_e276_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_cada_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_2087_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_2087_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_8c19_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l77_c7_546f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_40ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_546f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l74_c7_2156_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l74_c7_2156_iffalse := VAR_t8_MUX_uxn_opcodes_h_l77_c7_546f_return_output;
     -- t8_MUX[uxn_opcodes_h_l74_c7_2156] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l74_c7_2156_cond <= VAR_t8_MUX_uxn_opcodes_h_l74_c7_2156_cond;
     t8_MUX_uxn_opcodes_h_l74_c7_2156_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l74_c7_2156_iftrue;
     t8_MUX_uxn_opcodes_h_l74_c7_2156_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l74_c7_2156_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l74_c7_2156_return_output := t8_MUX_uxn_opcodes_h_l74_c7_2156_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l74_c7_2156] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l88_c7_8d4e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l74_c7_2156] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_ea86] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l68_c2_d460] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l77_c7_546f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c35_f2b8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l96_c7_ea86] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_cond;
     tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue;
     tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_return_output := tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_ea86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_return_output;

     -- printf_uxn_opcodes_h_l69_c3_e276[uxn_opcodes_h_l69_c3_e276] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l69_c3_e276_uxn_opcodes_h_l69_c3_e276_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l69_c3_e276_uxn_opcodes_h_l69_c3_e276_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_f2b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ea86_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ea86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_546f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l74_c7_2156_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_2156_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_d460_iffalse := VAR_t8_MUX_uxn_opcodes_h_l74_c7_2156_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ea86_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l93_c7_40ab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_cond;
     tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_return_output := tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l68_c2_d460] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l93_c7_40ab] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l84_c7_8c19] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_return_output := result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c35_0839] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_return_output;

     -- t8_MUX[uxn_opcodes_h_l68_c2_d460] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l68_c2_d460_cond <= VAR_t8_MUX_uxn_opcodes_h_l68_c2_d460_cond;
     t8_MUX_uxn_opcodes_h_l68_c2_d460_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l68_c2_d460_iftrue;
     t8_MUX_uxn_opcodes_h_l68_c2_d460_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l68_c2_d460_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_d460_return_output := t8_MUX_uxn_opcodes_h_l68_c2_d460_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l74_c7_2156] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l68_c2_d460] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l93_c7_40ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l99_c15_3e01_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c35_0839_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_40ab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_40ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_2156_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_8c19_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l68_c2_d460_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_40ab_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l88_c7_8d4e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output;

     -- MUX[uxn_opcodes_h_l99_c15_3e01] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l99_c15_3e01_cond <= VAR_MUX_uxn_opcodes_h_l99_c15_3e01_cond;
     MUX_uxn_opcodes_h_l99_c15_3e01_iftrue <= VAR_MUX_uxn_opcodes_h_l99_c15_3e01_iftrue;
     MUX_uxn_opcodes_h_l99_c15_3e01_iffalse <= VAR_MUX_uxn_opcodes_h_l99_c15_3e01_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l99_c15_3e01_return_output := MUX_uxn_opcodes_h_l99_c15_3e01_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l88_c7_8d4e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_cond;
     tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output := tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l68_c2_d460] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l88_c7_8d4e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l77_c7_546f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_return_output;

     -- Submodule level 5
     VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue := VAR_MUX_uxn_opcodes_h_l99_c15_3e01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l77_c7_546f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l74_c7_2156] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_return_output := result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l84_c7_8c19] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l84_c7_8c19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l84_c7_8c19] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_cond;
     tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue;
     tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_return_output := tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l96_c7_ea86] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_cond;
     result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_iftrue;
     result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_return_output := result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_8c19_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_8c19_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l96_c7_ea86_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_2156_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_546f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_8c19_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l77_c7_546f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l77_c7_546f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l77_c7_546f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l77_c7_546f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_546f_cond;
     tmp16_MUX_uxn_opcodes_h_l77_c7_546f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_546f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l77_c7_546f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_546f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_546f_return_output := tmp16_MUX_uxn_opcodes_h_l77_c7_546f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l93_c7_40ab] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_cond;
     result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_iftrue;
     result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_return_output := result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l68_c2_d460] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_return_output := result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_546f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_546f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_40ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_2156_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_546f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l74_c7_2156] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l88_c7_8d4e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_cond;
     result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output := result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l74_c7_2156] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l74_c7_2156] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l74_c7_2156_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_2156_cond;
     tmp16_MUX_uxn_opcodes_h_l74_c7_2156_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_2156_iftrue;
     tmp16_MUX_uxn_opcodes_h_l74_c7_2156_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_2156_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_2156_return_output := tmp16_MUX_uxn_opcodes_h_l74_c7_2156_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_2156_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_2156_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l88_c7_8d4e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_d460_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_2156_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l68_c2_d460] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l68_c2_d460] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l68_c2_d460_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_d460_cond;
     tmp16_MUX_uxn_opcodes_h_l68_c2_d460_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_d460_iftrue;
     tmp16_MUX_uxn_opcodes_h_l68_c2_d460_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_d460_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_d460_return_output := tmp16_MUX_uxn_opcodes_h_l68_c2_d460_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l68_c2_d460] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l84_c7_8c19] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_cond;
     result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_iftrue;
     result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_return_output := result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l77_c7_546f_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_8c19_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_d460_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l77_c7_546f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l77_c7_546f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l77_c7_546f_cond;
     result_pc_MUX_uxn_opcodes_h_l77_c7_546f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l77_c7_546f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l77_c7_546f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l77_c7_546f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l77_c7_546f_return_output := result_pc_MUX_uxn_opcodes_h_l77_c7_546f_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_2156_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l77_c7_546f_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l74_c7_2156] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l74_c7_2156_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_2156_cond;
     result_pc_MUX_uxn_opcodes_h_l74_c7_2156_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_2156_iftrue;
     result_pc_MUX_uxn_opcodes_h_l74_c7_2156_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_2156_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_2156_return_output := result_pc_MUX_uxn_opcodes_h_l74_c7_2156_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_d460_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_2156_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l68_c2_d460] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l68_c2_d460_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_d460_cond;
     result_pc_MUX_uxn_opcodes_h_l68_c2_d460_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_d460_iftrue;
     result_pc_MUX_uxn_opcodes_h_l68_c2_d460_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_d460_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_d460_return_output := result_pc_MUX_uxn_opcodes_h_l68_c2_d460_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09ef_uxn_opcodes_h_l106_l63_DUPLICATE_e54c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09ef_uxn_opcodes_h_l106_l63_DUPLICATE_e54c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09ef(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_d460_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_d460_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09ef_uxn_opcodes_h_l106_l63_DUPLICATE_e54c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09ef_uxn_opcodes_h_l106_l63_DUPLICATE_e54c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
